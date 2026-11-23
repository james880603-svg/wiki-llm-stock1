# Wiki 演進與操作日誌 (Change Log)

> 本檔案為追加寫入（Append-only）的歷史紀錄，記錄知識庫的每次匯入、重大問答與健康檢查。  
> 格式規範：`## [YYYY-MM-DD] [操作類型] | [簡短標題]`

---

## [2026-11-23] refactor | 知識庫重構為「股市量化與實證研究 (學術論文/因子策略)」專用架構
- **操作者**：LLM
- **重構成果**：
  - 目錄劃分為文獻庫 (`wiki/literature`)、因子庫 (`wiki/factors`)、技術指標 (`wiki/indicators`)、行為籌碼 (`wiki/behavior`)、市場異象 (`wiki/anomalies`)、計量方法 (`wiki/methodologies`) 與元分析 (`wiki/syntheses`)。
  - 建立論文、因子、指標、方法論 4 大學術專用範本。
  - 全面更新 `AGENTS.md`，規範實證金融資料提煉標準（樣外 $R^2$、夏普值、t-stat、交易摩擦考慮）。

---

## [2026-11-23] ingest | Gu, Kelly, Xiu (2020) - Empirical Asset Pricing via Machine Learning (RFS)
- **操作者**：LLM
- **來源檔案**：Review of Financial Studies, Vol 33, No 5, pp. 2223–2274.
- **新增與修改檔案**：
  - 新建文獻筆記：`wiki/literature/2020_RFS_Gu_Kelly_Xiu_Empirical_Asset_Pricing_via_Machine_Learning.md`
  - 新建方法論筆記：`wiki/methodologies/機器學習資產定價.md`
  - 新建因子筆記：`wiki/factors/動能與短期反轉因子.md`
  - 新建因子筆記：`wiki/factors/流動性因子.md`
  - 新建因子筆記：`wiki/factors/低波動與特質風險異象.md`
  - 更新導航索引：`index.md`
- **核心實證 Takeaways**：
  - 3 層神經網絡 (NN3) 具備最強月度個股預測力 ($R^2_{oos}=0.40\%$)，大型股更高達 0.70%。
  - NN4 構建之 10-1 多空分組年化夏普值達 1.35 (市值加權) 與 2.45 (等權)，且最大回撤僅 14.72%。
  - 全模型公認最重要預測信號為：價格趨勢（短期反轉 `mom1m`、動能 `mom12m`）、流動性（市值、換手率、Amihud）與波動度（特質風險）。
  - 金融低訊噪比特性決定「淺層學習優於深層網絡 (NN3 > NN5)」，特徵非線性交互作用是預測優勢核心。

---

## [2026-11-23] ingest | Barber, Lee, Liu, Odean (2009) - Just How Much Do Individual Investors Lose by Trading? (RFS)
- **操作者**：LLM
- **來源檔案**：Review of Financial Studies, Vol 22, No 2, pp. 609–632.
- **研究對象**：台灣證券交易所 (TSE) 1995–1999 全體投資人帳戶級逐筆委託與成交數據。
- **新增與修改檔案**：
  - 新建文獻筆記：`wiki/literature/2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading.md`
  - 新建行為筆記：`wiki/behavior/散戶交易虧損與法人超額收益.md`
  - 新建微觀結構筆記：`wiki/behavior/委託單積極度與流動性提供.md`
  - 新建行為筆記：`wiki/behavior/處分效應與過度自信.md`
  - 新建籌碼筆記：`wiki/behavior/三大法人與籌碼追蹤.md`
  - 連動更新因子筆記：`wiki/factors/動能與短期反轉因子.md`（加入處分效應作為動能微觀基礎）
  - 更新導航索引：`index.md`
- **核心實證 Takeaways**：
  - 台股散戶每年整體承受 3.8% 的績效折損（總損 9,350 億台幣，相當於台灣 GDP 的 2.2%）。
  - 散戶虧損分解：交易稅 34%、手續費 32%、選股毛損失 27%、擇時損失 7%。
  - 全體法人扣除交易成本後享有年化 1.5% 淨超額報酬；外資 (Foreigners) 掠奪近半 (46.2%) 法人利潤，形成實質跨境財富移轉。
  - 微觀結構震撼結論：散戶所有虧損幾乎 100% 來自「主動積極追價單 (Aggressive Orders)」；法人則同時從短線被動造市與長線知情積極單獲利。
  - 公益彩券 2002 年開賣使台股月換手率下降 25% ($t=-3.69$)，證實台股早期散戶具極強賭博與尋求刺激心理。

---

## [2026-11-23] ingest | Lopez-Lira, Tang (2026) - Can ChatGPT forecast stock price movements? (JFE)
- **操作者**：LLM
- **來源檔案**：Journal of Financial Economics, Vol 184 (2026), 104335.
- **研究對象**：CRSP 4,123 檔美股普通股、15.9 萬則新聞頭條（2021.10–2024.05 嚴格樣外）。
- **新增與修改檔案**：
  - 新建文獻筆記：`wiki/literature/2026_JFE_Lopez-Lira_Tang_Can_ChatGPT_Forecast_Stock_Price_Movements.md`
  - 新建方法論筆記：`wiki/methodologies/大語言模型與金融文字分析.md`
  - 新建行為筆記：`wiki/behavior/市場反應不足與漂移現象.md`
  - 連動更新方法論筆記：`wiki/methodologies/機器學習資產定價.md`（對比表格數值特徵 Shallow > Deep vs 文字特徵 Scale Emergence）
  - 連動更新行為筆記：`wiki/behavior/散戶交易虧損與法人超額收益.md`（加入有限處理能力與 AI 賦能理論模型）
  - 更新導航索引：`index.md`
- **核心實證 Takeaways**：
  - GPT-4 預測隔夜新聞即時開盤反應勝率達 93.3%（日組合層面）；隔日開盤至收盤漂移多空策略年化夏普值達 2.97，日均報酬 34 bps。
  - 金融推理為大型模型之「規模湧現能力」：GPT-4 (SR 2.97) > GPT-3.5 (1.66) > Llama2-70B (0.97) > FinBERT (-0.33) > 早期小模型 (全為負)。
  - 市場對格式化事件（財報、合作宣告）反應高效率；對需要複雜語意綜合的事件（內部人交易、股利政策）嚴重反應不足，後續漂移顯著。
  - 放空端夏普 (2.01) 遠高於做多端 (0.78)，小型股漂移大於大型股，體現放空成本與流動性之套利限制。
  - 2021Q4 到 2024 年策略夏普值從 6.54 遞減至 1.22，證實 AI 普及推動了市場價格發現效率，壓縮了 Alpha 空間。

---

## [2026-11-23] synthesis | AI在股市分析上的應用及問題 (生成 HTML 互動簡報與專題綜述)
- **操作者**：LLM
- **綜合文獻**：GKX (RFS 2020), Barber et al. (RFS 2009), Lopez-Lira & Tang (JFE 2026)。
- **新增產物**：
  - 獨立互動式 HTML 投影片：`d:\Wiki LLM\AI在股市分析上的應用及問題.html` (10 張投影片、鍵盤導航、全螢幕、目錄全覽)
  - 新建專題綜述筆記：`wiki/syntheses/AI在股市分析上的應用與問題專題綜述.md`
  - 更新導航索引：`index.md`
- **提煉核心架構**：
  - 三大應用：截面資產定價 (GKX)、新聞即時推理 (LLM)、捕捉市場反應不足與漂移。
  - 四大問題：極低訊噪比與過擬合 (Shallow > Deep)、模型規模臨界門檻效應、交易摩擦與微觀訂單結構、Alpha 的自我消亡與市場效率回饋。

---

## [2026-11-23] ingest | Fischer, Krauss (2018) - Deep learning with LSTM networks for financial market predictions (EJOR)
- **操作者**：LLM（Claude，接續 Antigravity）
- **來源檔案**：`raw/1-s2.0-S0377221717310652-main.pdf`（European Journal of Operational Research, Vol 270, pp. 654–669）
- **新增與修改檔案**：
  - 新建文獻筆記：`wiki/literature/2018_EJOR_Fischer_Krauss_Deep_Learning_with_LSTM_Networks_for_Financial_Market_Predictions.md`
  - 連動更新因子筆記：`wiki/factors/動能與短期反轉因子.md`（新增 LSTM 自行學到短期反轉型態）
  - 連動更新方法論筆記：`wiki/methodologies/機器學習資產定價.md`
  - 連動更新專題綜述：`wiki/syntheses/AI在股市分析上的應用與問題專題綜述.md`（2.4 Alpha 消亡加入深度學習年代前例）
  - 更新導航索引：`index.md`
- **核心實證 Takeaways**：
  - S&P 500 成分股 1992–2015，k=10 多空組合：LSTM 日均報酬扣成本前 0.46%、扣成本後 0.26%；年化夏普 5.83 → 2.34。
  - 勝過隨機森林 (扣成本後夏普 1.87)、DNN (0.52)、邏輯迴歸 (0.10)。
  - 分期：1993–2000 強勢、2001–2009 緩和、2010–2015 衰退，優勢被套利掉。
  - LSTM 選股共同特徵：短期反轉、高波動、低於平均動能。

---

## [2026-11-23] ingest | Fama (1970) - Efficient Capital Markets: A Review of Theory and Empirical Work (JF)
- **操作者**：LLM（Claude，接續 Antigravity）
- **來源檔案**：`raw/Fama-EfficientCapitalMarkets-1970.pdf`（Journal of Finance, Vol 25, No 2, pp. 383–417）
- **新增與修改檔案**：
  - 新建文獻筆記：`wiki/literature/1970_JF_Fama_Efficient_Capital_Markets.md`
  - 連動更新專題綜述：新增「0. 理論起點：為什麼預測股價很難？」
  - 更新導航索引：`index.md`
- **核心實證 Takeaways**：
  - 效率市場定義：價格隨時「完全反映」可得資訊；分弱式、半強式、強式三層檢驗。
  - 弱式：序列相關接近 0；小濾嘴法則優勢被約 0.1% 交易費用抹平。
  - 半強式：940 次股票分割、261 家公司盈餘公告研究皆支持效率市場。
  - 強式：只有交易所專業會員與公司內部人有獨占資訊證據；115 檔共同基金中 89 檔扣費後落後市場線。

---

## [2026-11-23] lint | 修正 index.md 中 Barber et al. (2009) 的誇大描述
- **操作者**：LLM（Claude）
- **問題**：`index.md` 文獻表寫「虧損 100% 來自積極單」，與文獻筆記原意「幾乎全部 (virtually all)」不符。
- **修正**：`index.md`、Barber 文獻筆記 frontmatter、`behavior/散戶交易虧損與法人超額收益.md`、`behavior/委託單積極度與流動性提供.md` 共 4 處，統一改為「幾乎全部」。
- **備註**：此錯誤源頭在 wiki 層，若未修正，下游簡報會被程式檢查判定為「數字找得到」而放行——數字檢查無法抓到「措辭誇大」，需靠 AI 審查。


---

## [2026-11-23] lint | 修正專題綜述中模型規模描述的內部矛盾
- **操作者**：LLM（Claude）
- **問題**：`wiki/syntheses/AI在股市分析上的應用與問題專題綜述.md` 寫「唯有千億級以上大模型（GPT-3.5, GPT-4, Llama2-70B）」，但 Llama2-70B 只有約 700 億參數，與「千億級」矛盾；簡報第 7 頁沿用了這個錯誤。
- **修正**：改為「參數規模跨過門檻的大型模型（Llama2-70B 約 700 億參數、GPT-3.5、GPT-4）」。

---

## [2026-11-23] query | 新增名詞小卡（因應簡報審查「可教性」不通過）
- **操作者**：LLM（Claude）
- **起因**：第 2 輪獨立審查指出簡報有至少 8 個關鍵術語（夏普值、Alpha、放空、bps、最大回撤、換手率、訊噪比、積極單等）未解釋就使用，而 wiki 內沒有對應定義，簡報若自行補寫會違反「只用 wiki」規則。
- **新增檔案**：`wiki/methodologies/名詞小卡.md`（12 個術語；能對應論文者標註出處，其餘明確標為「一般定義」）
- **更新導航索引**：`index.md`

---

## [2026-11-23] query | 名詞小卡補 9 個術語（graph 流程：大綱階段發現 wiki 缺定義）
- **操作者**：LLM（Claude）
- **起因**：loop 第 3 輪審查指出因子、動能、流動性、R²、漂移、損失函數、法人／外資、衝擊成本、逆向挑選未解釋；graph 規則為「wiki 缺 → 先補 wiki」，簡報不得自行定義。
- **修改**：`wiki/methodologies/名詞小卡.md` 新增上述 9 個術語（共 21 個），有出處者標註論文或方法論頁，其餘標「一般定義」。
