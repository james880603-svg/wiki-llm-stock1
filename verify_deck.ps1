# verify_deck.ps1 - Automated verification script for slide-loop specifications

$ErrorActionPreference = "Stop"
$htmlPath = "d:\Wiki LLM\output\deck.html"

if (-not (Test-Path $htmlPath)) {
    Write-Error "File output/deck.html does not exist!"
}

$rawHtml = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)

$report = @()
$report += "## 程式檢查報告"
$report += "檢查時間: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

$passed = $true

# 1. Slide count check (8 - 15)
$slideMatches = [regex]::Matches($rawHtml, '<div\s+class="slide[^"]*"\s+id="slide-(\d+)"')
$slideCount = $slideMatches.Count

if ($slideCount -lt 8 -or $slideCount -gt 15) {
    $report += "- ❌ 頁數檢查失敗: 投影片數量為 $slideCount 頁，規範要求 8–15 頁。"
    $passed = $false
} else {
    $report += "- ✅ 頁數檢查通過: 共 $slideCount 頁 (符合 8–15 頁規範)"
}

# 2. Check for raw unrendered math syntax like $...$ in the HTML body (excluding JS and CSS)
# Extract body content before <script>
$bodyHtml = ($rawHtml -split '<script')[0]
$unrenderedMathMatches = [regex]::Matches($bodyHtml, '(?<!\\)\$[^$<\n\r]+?\$')
if ($unrenderedMathMatches.Count -gt 0) {
    $report += "- ❌ 發現未渲染的 `$...$` 公式語法 ($($unrenderedMathMatches.Count) 處):"
    foreach ($m in $unrenderedMathMatches) {
        $report += "  - 未渲染公式: $($m.Value)"
    }
    $passed = $false
} else {
    $report += "- ✅ 公式渲染檢查通過: 未發現未渲染的 `$...$` 語法"
}

# 3. Parse each slide between <div class="slide and the next slide or end of content
$rawSlides = $bodyHtml -split '(?=<div\s+class="slide)' | Where-Object { $_ -match 'id="slide-(\d+)"' }

$slideIdx = 0
foreach ($s in $rawSlides) {
    $slideIdx++
    if ($s -match 'id="slide-(\d+)"') {
        $slideId = $Matches[1]
    } else {
        $slideId = $slideIdx
    }

    # Slide 1 is cover, no source required
    if ($slideIdx -eq 1) {
        $report += "- ✅ [第 1 頁] 封面頁 (無需出處標註)"
        continue
    }

    # Check if <div class="source" data-source="..."> exists
    if ($s -match '<div\s+class="source"\s+data-source="([^"]+)">') {
        $sourcePaths = $Matches[1] -split ';' | ForEach-Object { $_.Trim() }
        
        $combinedSourceText = ""
        $allFilesExist = $true
        foreach ($sp in $sourcePaths) {
            $fullPath = "d:\Wiki LLM\$sp"
            if (-not (Test-Path $fullPath)) {
                $report += "- ❌ [第 $slideIdx 頁] 引用檔案不存在: $sp"
                $passed = $false
                $allFilesExist = $false
            } else {
                $combinedSourceText += "`n" + [System.IO.File]::ReadAllText($fullPath, [System.Text.Encoding]::UTF8)
            }
        }
        if (-not $allFilesExist) {
            continue
        }

        # Extract slide text excluding <div class="source"...>
        $slideMain = ($s -split '<div\s+class="source"')[0]
        # Remove HTML tags
        $cleanText = [regex]::Replace($slideMain, '<[^>]+>', ' ')
        $cleanText = [System.Net.WebUtility]::HtmlDecode($cleanText)

        # Extract all numbers and percentages (excluding slide ID)
        $numMatches = [regex]::Matches($cleanText, '(?<![a-zA-Z0-9_])\d+(?:\.\d+)?%?(?![a-zA-Z0-9_])')
        $numbers = @()
        foreach ($nm in $numMatches) {
            $val = $nm.Value
            # Filter out slide index numbers like "2" on slide 2, or common single-digit enumeration 1, 2, 3
            if ($val -eq "$slideIdx" -or $val -eq "1" -or $val -eq "2" -or $val -eq "3" -or $val -eq "4") {
                continue
            }
            $numbers += $val
        }
        $numbers = $numbers | Select-Object -Unique

        $missing = @()
        foreach ($n in $numbers) {
            $rawN = $n.TrimEnd('%')
            if (-not $combinedSourceText.Contains($n) -and -not $combinedSourceText.Contains($rawN)) {
                $missing += $n
            }
        }

        if ($missing.Count -gt 0) {
            $report += "- ❌ [第 $slideIdx 頁] 數字無法在出處中找到: $($missing -join ', ') (出處: $sourcePaths)"
            $passed = $false
        } else {
            $report += "- ✅ [第 $slideIdx 頁] 出處存在且所有數字精確吻合 ($sourcePaths)"
        }

    } else {
        $report += "- ❌ [第 $slideIdx 頁] 缺少 `<div class=""source"" data-source=""wiki/..."">` 出處標註！"
        $passed = $false
    }
}

if ($passed) {
    $report += "`n### 判定結果: ✅ 程式檢查全數通過！"
} else {
    $report += "`n### 判定結果: ❌ 程式檢查發現未通過項目，請修正後重試。"
}

$finalReport = $report -join "`r`n"
Write-Output $finalReport
$finalReport | Out-File -Encoding UTF8 "d:\Wiki LLM\output\program_check.txt"
