1. Dữ liệu lệch phải mạnh (skewness = 3.46) → cân nhắc dùng log1p khi mô hình hoá.
2. Chênh lệch cực lớn giữa khu vực: khu cao nhất gấp 179 lần khu thấp nhất về nhu cầu trung bình.
3. permits_active (giấy phép thi công) tương quan dương có ý nghĩa với nhu cầu bảo trì (Spearman ρ=0.293, p<0.001), mạnh nhất ở cùng ngày (lag=0).
4. Tự tương quan theo mùa yếu (ACF tại 7 ngày chỉ 0.106) → baseline 'lặp lại tuần trước' không đủ mạnh, cần mô hình phức tạp hơn.
5. Có dấu hiệu đổi chế độ (regime shift) rõ rệt theo tháng (thay đổi 1.357, vượt ngưỡng 0.5) — cần khai thác ở RQ3.