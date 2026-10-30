# Zero-Shot Foundation Models versus Trained Learners for Weekly Street-Tree Service Demand

**Dự báo nhu cầu bảo trì cây xanh đường phố theo tuần cho 41 khu phố San Francisco** từ dữ liệu 311 Cases, Street Tree List, Street-Use Permits và thời tiết NOAA. Dự án so sánh 5 mô hình nền tảng zero-shot (Chronos-Bolt Small/Base, Chronos-2, Chronos-2 + biến ngoài, TimesFM 2.5) với 4 mô hình huấn luyện riêng và 3 mốc đơn giản, qua lần đổi hệ thống tiếp nhận 311 vào tháng 6/2024.

Môn học: **ADY201m** — Nhóm 10 — FPT University, TP. Hồ Chí Minh
Bài báo gửi hội nghị: **ICIIT 2027** (Hung Duc Nguyen, Cao Huy, Thu Le)

---

## Câu hỏi nghiên cứu

| | Câu hỏi |
|---|---|
| RQ1 | Cấu trúc nhu cầu: nhu cầu phân bố thế nào theo khu phố và thời gian, và lần đổi hệ thống 6/2024 đã thay đổi điều gì? |
| RQ2 | So sánh mô hình: mô hình nền tảng zero-shot có dự báo tuần tới chính xác hơn mốc đơn giản và mô hình huấn luyện riêng không? |
| RQ3 | Độ bền: kết quả có giữ nguyên trước và sau lần đổi hệ thống, ở khu phố ít và nhiều yêu cầu, và với các cách đếm khác không? |
| RQ4 | Độ tin cậy vận hành: khoảng dự báo có đúng độ bao phủ không, và dự báo có cảnh báo được tuần cao điểm không? |

## Kết quả chính

- **Mô hình nền tảng thắng 7/9 mốc kiểm tra.** TimesFM 2.5 có MAE **2.393** yêu cầu/tuần/khu phố, giảm **21.4%** sai số so với "lặp lại tuần trước" và **2.8%** so với mô hình huấn luyện tốt nhất (Random Forest). TimesFM tốt hơn ở khoảng **66%** số tuần (Wilcoxon, hiệu chỉnh Holm, p < 1e-6).
- **Lợi thế lớn nhất ở chuỗi thưa:** MASE thấp hơn **11–12%** ở nhóm khu phố ít yêu cầu và với loại "cây hư hại".
- **Lần đổi hệ thống 6/2024 làm thay đổi cơ cấu loại yêu cầu** (khoảng cách cơ cấu 24.0 điểm %, gấp đôi mức cao nhất trước đó), **nhưng không làm đổi tổng số yêu cầu** (+8.4%, trong phạm vi bình thường).
- Thứ hạng giữ nguyên trước và sau lần đổi hệ thống, và với cả 3 cách đếm (bỏ trùng, giữ trùng, chỉ cây hư hại).
- Biến ngoài (thời tiết, giấy phép) không giúp được. Tái huấn luyện mỗi 4 tuần chỉ thay đổi sai số dưới 0.5%.
- **Khoảng conformal đạt đúng độ bao phủ 80%**, còn khoảng có sẵn của mô hình nền tảng chỉ phủ 74–78%. Chưa có cách cảnh báo tuần cao điểm nào đủ tin cậy.

## Cấu trúc thư mục

```
├── Notebook/
│   ├── 1. Business Understanding and Analytic Approach.ipynb   # bài toán, câu hỏi nghiên cứu, cách đánh giá
│   ├── 2. Data Collection Understanding Preparation.ipynb      # thu thập, làm sạch, chống rò rỉ, gom theo tuần
│   ├── 3. Data Analysis with SQL.ipynb                         # DuckDB, tạo đặc trưng trễ
│   ├── 4. Data Analysis with Python.ipynb                      # EDA, trực quan hoá, kiểm định
│   ├── 5. Model Training and Comparison.ipynb                  # thử nghiệm ban đầu
│   ├── 6. Intake Regime Change.ipynb                           # phân tích lần đổi hệ thống 6/2024 (RQ1, RQ3)
│   ├── 7. Model Benchmark.ipynb                                # 12 mô hình, 9 mốc, 3 biến đếm (RQ2, RQ3)
│   └── 8. Uncertainty and Alerts.ipynb                         # khoảng dự báo và cảnh báo (RQ4)
├── Data/
│   ├── raw/          # dữ liệu gốc (không đưa lên GitHub)
│   └── processed/    # dữ liệu đã làm sạch và kết quả dự báo
├── Outputs/
│   ├── figures/      # biểu đồ
│   └── tables/       # bảng kết quả
├── requirements.txt
└── README.md
```

## Nguồn dữ liệu

| Nguồn | Vai trò | Link |
|---|---|---|
| SF 311 Cases (`Tree Maintenance`) | Biến mục tiêu | https://data.sfgov.org/d/vw6y-z8j6 |
| SF Street Tree List | Đặc điểm cây theo khu phố | https://data.sfgov.org/d/tkzw-k3nq |
| SF Street-Use Permits | Hoạt động thi công đường phố | https://data.sfgov.org/d/b6tj-gt35 |
| NOAA GHCN-Daily, trạm SFO (USW00023234) | Thời tiết | https://www.ncei.noaa.gov/access/services/data/v1 |

Giai đoạn phân tích: **05/01/2015 – 11/10/2026** (614 tuần × 41 khu phố). Dữ liệu tải ngày 16/10/2026.

## Cách chạy

```bash
pip install -r requirements.txt
```

1. Mở thư mục `Notebook/` và chạy lần lượt Notebook 1 → 8.
2. Thư mục `Data/raw/` không có trên GitHub vì file quá lớn. Ở lần chạy đầu, đặt `TAI_LAI_DU_LIEU = True` trong Notebook 2 để tải lại dữ liệu gốc từ các link trên.
3. Notebook 7 tải các mô hình nền tảng từ Hugging Face ở lần chạy đầu: `amazon/chronos-bolt-small`, `amazon/chronos-bolt-base`, `amazon/chronos-2`, `google/timesfm-2.5-200m-pytorch`. Nếu tải bị kẹt, chạy trước trong terminal:

```bash
set HF_HUB_DISABLE_XET=1
hf download amazon/chronos-2
hf download google/timesfm-2.5-200m-pytorch
hf download amazon/chronos-bolt-base
hf download amazon/chronos-bolt-small
```

Mô hình nền tảng chạy được trên GPU 4 GB (các mô hình được nạp lần lượt từng cái một).
