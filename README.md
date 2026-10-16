# Weekly Street Tree Service Demand Forecasting for San Francisco Neighbourhoods

**Dự báo nhu cầu bảo trì cây xanh đường phố theo tuần cho các khu phố San Francisco** từ dữ liệu 311 Cases, Street Tree List, Street-Use Permits và thời tiết NOAA, so sánh các mô hình học máy với mô hình nền chuỗi thời gian zero-shot (Chronos-Bolt).

Môn học: **ADY201m** — Nhóm 10 — FPT University, TP. Hồ Chí Minh

---

## Câu hỏi nghiên cứu

| | Câu hỏi |
|---|---|
| RQ1 | Nhu cầu bảo trì cây xanh biến động thế nào theo khu phố, theo tháng và qua các năm? |
| RQ2 | Trong 6 mô hình, mô hình nào dự báo chính xác nhất cho tuần tới và tổng quát hoá tốt sang khu phố mới? |
| RQ3 | Khoảng dự báo và cảnh báo tuần nguy cơ cao đáng tin cậy đến mức nào? |
| RQ4 | Những yếu tố nào thực sự đóng góp vào độ chính xác dự báo? |
| RQ5 | Tái huấn luyện định kỳ có giúp mô hình thích ứng tốt hơn khi điều kiện thay đổi không? |

## Kết quả chính

- **Chronos-Bolt (zero-shot)** dự báo tốt nhất: MAE **2.60** yêu cầu/tuần/khu phố, giảm **20.2%** sai số so với mốc "lặp lại tuần trước", tốt hơn Ridge có ý nghĩa thống kê (Wilcoxon, p < 0.0001).
- Chỉ **lịch sử nhu cầu gần đây** thật sự giúp dự báo; thời tiết và giấy phép thi công gần như không đóng góp.
- Khoảng dự báo 90% đạt độ bao phủ thực tế **89.2%**, ổn định qua các năm.
- Tái huấn luyện mỗi 4 tuần giảm sai số **1.9%**, hiệu quả rõ khi nhu cầu tăng mạnh từ 2025.

## Cấu trúc thư mục

```
├── Notebook/
│   ├── 1. Business Understanding and Analytic Approach.ipynb
│   ├── 2. Data Collection Understanding Preparation.ipynb   # thu thập, làm sạch, gom theo tuần
│   ├── 3. Data Analysis with SQL.ipynb                      # DuckDB, tạo đặc trưng trễ
│   ├── 4. Data Analysis with Python.ipynb                   # EDA, trực quan hoá, kiểm định
│   └── 5. Model Training and Comparison.ipynb               # 6 mô hình, RQ2–RQ5
├── Data/
│   ├── raw/          # dữ liệu gốc (không đưa lên GitHub, Notebook 2 tự tải về)
│   └── processed/    # dữ liệu đã làm sạch
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

Mở thư mục `Notebook/` và chạy lần lượt Notebook 1 → 5. Notebook 2 tự tải dữ liệu gốc vào `Data/raw/`; Notebook 5 tự tải mô hình Chronos-Bolt (khoảng 200 MB) từ Hugging Face ở lần chạy đầu.
