# 股市分析與量化實證研究 Wiki 總目錄 (Index)

> 最後更新時間：2026-11-23  
> 本檔案由 LLM 於每次 `/ingest`、`/query` 或 `/lint` 時自動維護，為整個量化實證知識庫的導航與檢索中樞。

---

## 1. 核心學術論文與文獻庫 (Literature)
| 論文名稱 / 引用鍵 | 年份 | 期刊 / 學校 | 市場與樣本 | 核心方法 | 關鍵結論與績效 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [[2020_RFS_Gu_Kelly_Xiu_Empirical_Asset_Pricing_via_Machine_Learning]] | 2020 | Review of Financial Studies | 美股全市場 (1957–2016) | 機器學習全模型 (NN, Tree, ENet) | 3層神經網絡月度 $R^2_{oos}=0.40\%$；多空年化夏普值達 1.35 (VW) / 2.45 (EW)；確立動能、流動性與波動度為核心驅動 |
| [[2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading]] | 2009 | Review of Financial Studies / 政大 | 台股全市場 (1995–1999) | 帳戶級訂單微觀結構分析 / 損益分解 | 台股散戶年化虧損 3.8% (GDP 2.2%)，虧損幾乎全部來自積極單；法人年化淨賺 1.5% (外資佔半) |
| [[2026_JFE_Lopez-Lira_Tang_Can_ChatGPT_Forecast_Stock_Price_Movements]] | 2026 | Journal of Financial Economics | 美股 4,123 檔股票 (2021–2024) | LLM 零樣本提示詞 (GPT-4) / 主題回歸 | 隔夜新聞初始反應勝率 93.3%；後續漂移多空年化夏普 2.97 (日均 34 bps)；確立複雜文本之金融推理為模型規模湧現能力 |
| [[2018_EJOR_Fischer_Krauss_Deep_Learning_with_LSTM_Networks_for_Financial_Market_Predictions]] | 2018 | European Journal of Operational Research | 美股 S&P 500 成分股 (1992–2015) | LSTM 深度學習 vs RF / DNN / 邏輯迴歸 | LSTM 扣成本後年化夏普 2.34 (扣成本前 5.83)，勝過所有對照；但 2010 年後優勢被套利掉，獲利在零附近波動 |
| [[1970_JF_Fama_Efficient_Capital_Markets]] | 1970 | Journal of Finance | 美股 (文獻回顧) | 弱式／半強式／強式效率檢驗 | 效率市場模型大致成立；只有交易所專業會員與公司內部人有獨占資訊的證據；115 檔基金中 89 檔扣費後落後市場 |

---

## 2. 因子研究庫 (Factors)
| 因子名稱 | 類別 | 理論假說 / 邏輯 | 當前實證地位 | 核心代理變數 | 關聯文獻 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [[動能與短期反轉因子]] | 價量趨勢 | 行為偏差（反應不足/過度）與流動性補償 | 跨模型公認最強預測力 | `mom1m`, `mom12m`, `chmom` | [[2020_RFS_Gu_Kelly_Xiu_Empirical_Asset_Pricing_via_Machine_Learning]], [[2018_EJOR_Fischer_Krauss_Deep_Learning_with_LSTM_Networks_for_Financial_Market_Predictions]], [[2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading]] |
| [[流動性因子]] | 市場摩擦 | 非流動性溢酬與異質信念 | 穩健有效 | `mvel1`, `turn`, `ill`, `dolvol` | [[2020_RFS_Gu_Kelly_Xiu_Empirical_Asset_Pricing_via_Machine_Learning]] |
| [[低波動與特質風險異象]] | 風險異象 | 槓桿限制與彩券投機偏好 | 大型股格外顯著 | `retvol`, `idiovol`, `beta` | [[2020_RFS_Gu_Kelly_Xiu_Empirical_Asset_Pricing_via_Machine_Learning]] |

---

## 3. 技術面指標與交易策略 (Technical Indicators)
| 指標名稱 | 類型 | 適用週期 | 交易規則 | 實證有效性結論 | 關聯文獻 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| *待匯入博碩士論文* | | | | | |

---

## 4. 行為財務與籌碼分析 (Behavioral & Sentiment)
| 主題與機制 | 觀察指標 | 行為偏差根源 | 實證超額報酬能力 | 關聯文獻 |
| :--- | :--- | :--- | :--- | :--- |
| [[散戶交易虧損與法人超額收益]] | 散戶 vs 法人淨買賣金額 | 資訊不對稱、噪訊交易 | 散戶年虧 3.8% (GDP 2.2%)；法人年淨賺 1.5% | [[2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading]] |
| [[委託單積極度與流動性提供]] | 積極單 (吃單) vs 被動單 (掛單) | 衝擊成本與逆向挑選 (Pick-off) | 散戶積極單全盤皆輸；法人積極單在 140 天大幅獲利 | [[2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading]] |
| [[處分效應與過度自信]] | 換手率 (Turnover)、彩券虛擬變數 | 展望理論、追求刺激與賭博心理 | 彩券發行後台股月換手率下降 25%，過度交易損耗巨大 | [[2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading]] |
| [[三大法人與籌碼追蹤]] | 外資、投信、自營商買賣超 | 知情交易者、流動性推動 | 外資佔近 50% 法人利潤；持倉 140 天收益達峰值 | [[2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading]] |
| [[市場反應不足與漂移現象]] | 新聞後漂移、PEAD、主題分解 | 有限注意力、語意推理複雜度、放空限制 | GPT-4 隔夜新聞漂移年化夏普 2.97；負向新聞與小型股漂移最顯著 | [[2026_JFE_Lopez-Lira_Tang_Can_ChatGPT_Forecast_Stock_Price_Movements]], [[2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading]] |

---

## 5. 市場異象與總體事件 (Anomalies & Events)
| 異象 / 事件名稱 | 類型 | 發生時間點 / 條件 | 統計顯著性 | 關聯文獻 |
| :--- | :--- | :--- | :--- | :--- |
| *待匯入除權息/法說會宣告論文* | | | | |

---

## 6. 計量與機器學習方法論 (Methodologies)
| 方法名稱 | 類別 | 核心優勢 | 經典實證基準 | 關聯文獻 |
| :--- | :--- | :--- | :--- | :--- |
| [[機器學習資產定價]] | 統計學習 (數值型) | 捕捉高維特徵非線性交互、正則化防過擬合 | 淺層勝於深層 (NN3/GBRT) | [[2020_RFS_Gu_Kelly_Xiu_Empirical_Asset_Pricing_via_Machine_Learning]], [[2026_JFE_Lopez-Lira_Tang_Can_ChatGPT_Forecast_Stock_Price_Movements]] |
| [[大語言模型與金融文字分析]] | 生成式 AI (文字型) | 零樣本語意因果推理、非結構化新聞直接定價 | 規模湧現 (GPT-4 > GPT-3.5 > FinBERT) | [[2026_JFE_Lopez-Lira_Tang_Can_ChatGPT_Forecast_Stock_Price_Movements]] |
| [[名詞小卡]] | 名詞解釋 | 給初學者的 12 個基本術語（夏普值、Alpha、放空、bps、過擬合等），標明論文出處或一般定義 | — | [[2018_EJOR_Fischer_Krauss_Deep_Learning_with_LSTM_Networks_for_Financial_Market_Predictions]], [[2009_RFS_Barber_Lee_Liu_Odean_Just_How_Much_Do_Individual_Investors_Lose_by_Trading]] |

---

## 7. 跨文獻元分析與專題綜合 (Syntheses)
| 專題標題 | 比較範疇 | 核心綜述結論 | 完成日期 |
| :--- | :--- | :--- | :--- |
| [[AI在股市分析上的應用與問題專題綜述]] | Fama (1970), GKX (2020), Fischer & Krauss (2018), Lopez-Lira (2026), Barber (2009) | 系統性提煉 AI 在數值與文本定價的三大應用，與過擬合、門檻、執行成本、Alpha自我消亡四大陷阱；產出互動式簡報 [投影片.html](file:///d:/Wiki%20LLM/AI在股市分析上的應用及問題.html) | 2026-11-23 |
