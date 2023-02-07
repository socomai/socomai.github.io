# Giá trị kỳ vọng, phương sai, độ lệch chuẩn
Thực hiện 5 phép đo cân nặng khác nhau của 1 vật và cho ra 5 kết quả khác nhau thì:  

- Cân nặng thực tế của vật là ___TRỌNG SỐ___
- Chúng ta không biết giá trị thực của trọng số vì nó là 1 BIẾN ẨN
- Chúng ta có thể ước tính trọng số bằng cách lấy trung bình cộng của các kết quả đo được, kết quả thu được là GÍA TRỊ KỲ VỌNG của trọng số chính là GIÁ TRỊ TRUNG BÌNH bạn ước đoán được sau nhiều lần thử nghiệm.
- Giá trị trung bình được ký hiệu bằng μ. Giá trị kỳ vọng ký hiệu bằng E.
- Thước đo mức độ trải rộng/sai khác của tập dữ liệu so với giá trị trung bình của nó gọi là PHƯƠNG SAI - VARIANCE (σ2). Sở dĩ bình phương vì có các giá trị âm, ta cần bình phương lên để loại bỏ các giá trị âm.
- Căn bậc 2 của phương sai gọi là ĐỘ LỆCH CHUẨN (σ). Sở dĩ cần căn bậc 2 vì ta cần đo bằng đơn vị ban đầu (VD: m) thay vì đơn vị đã bình phương (VD: m2).
- Khi chúng ta ước tính phương sai, chúng ta sẽ không chuẩn hoá bởi hệ số N mà sẽ chuẩn hoá bởi hệ số N-1. Hệ số N-1 được gọi là HIỆU CHỈNH BESSEL.

Ví dụ về phương sai và độ lệch chuẩn:

1. Để tính mức độ sai khác của tập dữ liệu ta lấy từng giá trị trừ đi giá trị trung bình μ: `xn - μ`
2. Kết quả sẽ có các giá trị âm, để loại bỏ các giá trị âm ta bình phương lên `(xn - μ)^2`
3. Để tính toán phương sai ta lấy giá trị trung bình của tất cả các bình phương bên trên: `1/n * Z(xn - μ)^2`
4. Để tính toán độ lệch chuẩn ta lấy căn bậc 2 của phương sai đã nói ở trên để quay lại đơn vị ban đầu
5. Theo hiệu chỉnh Bessel, phương sai phải viết lại là: `1/(n-1) * Z(xn - μ)^2`.

# Phân Phối (Phân Bố) Chuẩn, PDF
- Tần suất của các giá trị xuất hiện xung quanh giá trị trung bình cao hơn tần suất xuất hiện của các giá trị ở xa trung bình.
- 68.26% tổng giá trị nằm trong khoảng 01 độ lệch chuẩn so với giá trị trung bình `(μ +- σ)`
    - Tức là nếu giá trị trung bình là 1.9m thì 68.26% số giá trị sẽ nằm trong khoảng từ 1.7m - 2.1m.
- 95.44% tổng giá trị nằm trong khoảng 02 độ lệch chuẩn so với giá trị trung bình.
- 99.74% tổng giá trị nằm trong khoảng 03 độ lệch chuẩn so với giá trị trung bình.
- Những phân phối (phân bố) với xác suất như trên gọi là PHÂN PHỐI CHUẨN còn gọi là PHÂN BỐ GAUSSIAN.
- Đường con Gaussian được gọi là HÀM MẬT ĐỘ XÁC SUẤT (PDF).
- Thiết kế của bộ lọc Kalman giả định các sai số đo được phân phối chuẩn.

# Biến ngẫu nhiên liên tục và biến ngẫu nhiên rời rạc
- Thời gian sạc pin hoặc thời gian chạy đua marathon là các biến ngẫu nhiên liên tục
- Số lượng khách truy cập trang web hoặc số học sinh trong 1 lớp học là các biến ngẫu nhiên rời rạc vì chúng có thể đếm được.
- Tất cả các phép đo đều là biến ngẫu nhiên liên tục.
- Độ chính xác ACCURACY cho biết độ xác thực của phép đo so với giá trị thực. Hệ thống có độ chính xác thấp được gọi là HỆ THỐNG THIÊN VỊ (BIASED SYSTEM) do trong kết quả đo luôn có 1 sai số hệ thống (systematic error) không đổi (bias) - có thể do thiết bị hay môi trường không đảm bảo.
- Độ chuẩn xác PRECISION mô tả khả năng thay đổi trong 1 phép đo sử dụng cùng 1 thông số. Độ chuẩn xác cao tương đương với phương sai thấp. Chính là khoảng cách E+-σ. Còn được gọi là độ nhiễu (noise), độ nhiễu ngẫu nhiên (random noise), độ không đảm bảo của phép đo.
- Giả định các hệ thống là các hệ thống KHÔNG THIÊN VỊ (UNBIASED SYSTEM) tức là các phép đo có độ chính xác chấp nhận được.

# Tổng kết nhỏ
```
                                         ACCURACY (bias)
                      |<-------------------------------------------------------->|
                      |                                                          |
                      |                                                       .  .  .
                      |                                                    .     |     .
                      |                                                 .        |        .PDF - Hàm mật độ xác suất
                      |                                              .           |           .
                      |                                           . |            |           |  .
                      |                                        .    |            |           |     . 
                      |                                     .       |            |           |        .
                      |                                  .          |            |           |           .
----------------------+---------------------------------------------+------------+-----------+-----------------------------------
                  TRỌNG SỐ                                         -σ            E           +σ
                  TRUE VALUE                                        |<---------------------->|
                                                                            PRECISION            
```

# Hiệp phương sai
- Nếu như phương sai đo mức độ chính xác của 1 trọng số thì HIỆP PHƯƠNG SAI - COVARIANCE đo sự biến thiên cùng nhau của 02 trọng số. Nếu 2 trọng số có xu hướng thay đổi cùng nhau (cùng tăng, cùng giảm) thì hiệp phương sai của 2 biến có giá trị dương. Ngược lại thì hiệp phương sai có giá trị âm.
- Công thức tính hiệp phương sai có dạng: `cov(X, Y) = E((X-μ)*(Y-v))`. Trong đó μ, v là giá trị kỳ vọng của X và Y.
- Nếu X và Y độc lập thì hiệp phương sai của X, Y bằng 0. Nhưng điều ngược lại không đúng.

# Ma trận hiệp phương sai (Coveriance Matric)
- Khi trọng số X là 1 vector n phần tử thì MA TRẬN HIỆP PHƯƠNG SAI - COVERIANCE MATRIX của X sẽ phải là 1 ma trận Σ[n,n] mà trong đó `Σi,j = cov(Xi, Xj) = E((Xi - μi)*(Xj - μj))` hay nói cách khác trong đó mỗi thành phần của Σ là hiệp phương sai của Xi, Xj tương ứng.
- Ma trận hiệp phương sai sẽ có dạng đối xứng symetric.
- Ma trận hiệp phương sai là khái niệm quan trọng trong kinh tế học do đó không được bỏ qua.

```
X = | X1 |   ---> Σ = | Σ11  Σ12 |    ---> Σ = | cov(X1, X1)   cov(X1, X2) |    --->  Σ = | E((X1-μ1)(X1-μ1))   E((X1-μ1)(X2-μ2)) |
    | X2 |            | Σ21  Σ22 |             | cov(X2, X1)   cov(X2, X2) |              | E((X2-μ2)(X1-μ1))   E((X2-μ2)(X2-μ2)) |
```

Trong Kalman Filter, ma trận hiệp phương sai được ký hiệu là Pk và giả sử với vector trọng số là ma trận của vị trí và tốc độ.
```
X = | position |   ---> Σ = | Σpp  Σpv |
    | velocity |            | Σvp  Σvv |
```

Với Kalman filter, ta cần dự đoán trọng số Xk dựa trên trọng số hiện tại Xk-1. Giả sử rằng vận tốc chuyển động không đổi thì:

```
pk = pk-1 + Δt*vk-1   --->  Xk = | 1  Δt | Xk-1   ---> Xk = Fk * Xk-1
vk =           vk-1              | 0   1 |

```

