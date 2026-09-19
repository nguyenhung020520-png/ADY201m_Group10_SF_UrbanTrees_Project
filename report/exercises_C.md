# Bài tập mở rộng — Notebook_C

## Bài 4: Phân rã mùa (STL)

Với khu vực đầu tiên trong danh sách, residual chiếm 68.6% phương sai của chuỗi (trend + seasonal-tuần chỉ giải thích 31.4%). Kết quả này khớp với ACF yếu tại lag mùa (0.106, EDA #4): biến động của nhu cầu bảo trì cây chủ yếu đến từ các sự kiện bất thường (bão, cây gãy đột xuất), không phải chu kỳ tuần đều đặn. Xem hình report/fig_exercise_stl.png.

## Bài 4: Phân rã mùa (STL)

Với khu vực đầu tiên trong danh sách, residual chiếm 68.6% phương sai của chuỗi (trend + seasonal-tuần chỉ giải thích 31.4%). Kết quả này khớp với ACF yếu tại lag mùa (0.106, EDA #4): biến động của nhu cầu bảo trì cây chủ yếu đến từ các sự kiện bất thường (bão, cây gãy đột xuất), không phải chu kỳ tuần đều đặn. Xem hình report/fig_exercise_stl.png.

## Bài 2: So sánh tần suất (ngày vs tuần)

Seasonality theo ngày-trong-tuần (strength=0.131, đo được ở tần suất ngày) mạnh hơn hẳn seasonality theo tháng-trong-năm (0.051). Khi gộp thô hơn thành tuần, tín hiệu tháng tăng lên 0.077 (+51%) do nhiễu ngày-qua-ngày bị san phẳng, nhưng đổi lại mất hoàn toàn khả năng quan sát hiệu ứng ngày-trong-tuần. Kết luận: tần suất ngày hiện tại phù hợp hơn cho RQ2/RQ3 vì cần phân biệt theo từng ngày.

## Bài 3: Truy vấn SQL mở rộng (QUALIFY, CTE)

Query 1 (QUALIFY) cho thấy Mission luôn xếp hạng 1 mọi tháng (2.67 và 2.53 ca/ngày). Query 2 (CTE, WITH) định lượng rõ hơn: Mission cao hơn trung bình toàn thành phố (0.583) tới 2.110 ca/ngày, gấp khoảng 4.6 lần trung bình thành phố — cách biệt lớn nhất trong 41 khu, trong khi khu thấp nhất (Inner Richmond) đã âm so với trung bình (-0.052).

## Bài 4: Phân rã mùa (STL)

Với khu vực đầu tiên trong danh sách, residual chiếm 68.6% phương sai của chuỗi (trend + seasonal-tuần chỉ giải thích 31.4%). Kết quả này khớp với ACF yếu tại lag mùa (0.106, EDA #4): biến động của nhu cầu bảo trì cây chủ yếu đến từ các sự kiện bất thường (bão, cây gãy đột xuất), không phải chu kỳ tuần đều đặn. Xem hình report/fig_exercise_stl.png.

## Bài 2: So sánh tần suất (ngày vs tuần)

Seasonality theo ngày-trong-tuần (strength=0.131, đo được ở tần suất ngày) mạnh hơn hẳn seasonality theo tháng-trong-năm (0.051). Khi gộp thô hơn thành tuần, tín hiệu tháng tăng lên 0.077 (+51%) do nhiễu ngày-qua-ngày bị san phẳng, nhưng đổi lại mất hoàn toàn khả năng quan sát hiệu ứng ngày-trong-tuần. Kết luận: tần suất ngày hiện tại phù hợp hơn cho RQ2/RQ3 vì cần phân biệt theo từng ngày.

## Bài 3: Truy vấn SQL mở rộng (QUALIFY, CTE)

Query 1 (QUALIFY) cho thấy Mission luôn xếp hạng 1 mọi tháng (2.67 và 2.53 ca/ngày). Query 2 (CTE, WITH) định lượng rõ hơn: Mission cao hơn trung bình toàn thành phố (0.583) tới 2.110 ca/ngày, gấp khoảng 4.6 lần trung bình thành phố — cách biệt lớn nhất trong 41 khu, trong khi khu thấp nhất (Inner Richmond) đã âm so với trung bình (-0.052).

## Bài 1: Thêm nguồn dữ liệu thứ ba (thời tiết NOAA, trạm SFO)

Ghép dữ liệu thời tiết NOAA (trạm SFO, USW00023234, 2015-2026, 4276 ngày) vào bảng chính theo ngày (city-wide, không phân biệt khu). Tương quan Spearman với target: PRCP (lượng mưa) rho=0.014, AWND (tốc độ gió) rho=0.071 — cả hai đều rất yếu so với permits_active đã có (rho=0.293), dù p<0.001 ở cả hai (do cỡ mẫu lớn ~175 nghìn dòng, p nhỏ không đồng nghĩa với ảnh hưởng lớn). Kết luận: thời tiết trong ngày đóng góp rất ít cho việc dự báo so với permits_active; có thể do nhóm yêu cầu 'bảo trì cây' gộp nhiều loại việc khác nhau, không chỉ riêng cây đổ/gãy do thời tiết.

## Bài 4: Phân rã mùa (STL)

Với khu vực đầu tiên trong danh sách, residual chiếm 68.6% phương sai của chuỗi (trend + seasonal-tuần chỉ giải thích 31.4%). Kết quả này khớp với ACF yếu tại lag mùa (0.106, EDA #4): biến động của nhu cầu bảo trì cây chủ yếu đến từ các sự kiện bất thường (bão, cây gãy đột xuất), không phải chu kỳ tuần đều đặn. Xem hình report/fig_exercise_stl.png.

## Bài 2: So sánh tần suất (ngày vs tuần)

Seasonality theo ngày-trong-tuần (strength=0.131, đo được ở tần suất ngày) mạnh hơn hẳn seasonality theo tháng-trong-năm (0.051). Khi gộp thô hơn thành tuần, tín hiệu tháng tăng lên 0.077 (+51%) do nhiễu ngày-qua-ngày bị san phẳng, nhưng đổi lại mất hoàn toàn khả năng quan sát hiệu ứng ngày-trong-tuần. Kết luận: tần suất ngày hiện tại phù hợp hơn cho RQ2/RQ3 vì cần phân biệt theo từng ngày.

## Bài 3: Truy vấn SQL mở rộng (QUALIFY, CTE)

Query 1 (QUALIFY) cho thấy Mission luôn xếp hạng 1 mọi tháng (2.67 và 2.53 ca/ngày). Query 2 (CTE, WITH) định lượng rõ hơn: Mission cao hơn trung bình toàn thành phố (0.583) tới 2.110 ca/ngày, gấp khoảng 4.6 lần trung bình thành phố — cách biệt lớn nhất trong 41 khu, trong khi khu thấp nhất (Inner Richmond) đã âm so với trung bình (-0.052).

## Bài 1: Thêm nguồn dữ liệu thứ ba (thời tiết NOAA, trạm SFO)

Ghép dữ liệu thời tiết NOAA (trạm SFO, USW00023234, 2015-2026, 4276 ngày) vào bảng chính theo ngày (city-wide, không phân biệt khu). Tương quan Spearman với target: PRCP (lượng mưa) rho=0.014, AWND (tốc độ gió) rho=0.071 — cả hai đều rất yếu so với permits_active đã có (rho=0.293), dù p<0.001 ở cả hai (do cỡ mẫu lớn ~175 nghìn dòng, p nhỏ không đồng nghĩa với ảnh hưởng lớn). Kết luận: thời tiết trong ngày đóng góp rất ít cho việc dự báo so với permits_active; có thể do nhóm yêu cầu 'bảo trì cây' gộp nhiều loại việc khác nhau, không chỉ riêng cây đổ/gãy do thời tiết.

