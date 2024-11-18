CREATE DATABASE vinabook;
go
USE vinabook;
go
CREATE TABLE Người_dùng(
    Mã_người_dùng VARCHAR(50) PRIMARY KEY,
    Họ_tên NVARCHAR(255),
    Ngày_Sinh DATE,
    Giới_Tính NVARCHAR(10),
    Email NVARCHAR(255),
    Mật_khẩu NVARCHAR(255),
    vấn_đề NVARCHAR(255)
);
go
CREATE TABLE Địa_chỉ(
    ID_Địa_chỉ VARCHAR(50) PRIMARY KEY,
    Tên_Địa_chỉ NVARCHAR(255)
);
go
CREATE TABLE Người_Hỗ_Trợ(
    Mã_Người_Hỗ_Trợ VARCHAR(50) PRIMARY KEY,
    Thời_Gian TIME,
    Vấn_đề NVARCHAR(255),
    Tên_Người_Hỗ_Trợ NVARCHAR(255)
);
go
CREATE TABLE Tác_giả(
    ID VARCHAR(50) PRIMARY KEY,
    Tên NVARCHAR(255)
);
go
CREATE TABLE Sách(
    Mã_Sách VARCHAR(50) PRIMARY KEY,
    Tên_Sách NVARCHAR(255),
    giá_tiền MONEY,
    ngôn_ngữ NVARCHAR(50),
    Số_lượng INT,
    Ngày_xuất_bản DATE
);
go
CREATE TABLE Thể_Loại(
    Mã_Thể_loại VARCHAR(50) PRIMARY KEY,
    Tên_thể_loại NVARCHAR(255)
);
go
CREATE TABLE Giao_hàng(
    Mã_giao_hàng VARCHAR(50) PRIMARY KEY,
    loại NVARCHAR(50),
    Giá_tiền MONEY
);
go
CREATE TABLE Phương_thức_thanh_toán(
    Mã_Thanh_Toán VARCHAR(50) PRIMARY KEY,
    Ngày_hết_hạn DATE,
    VAT FLOAT,
    Ngân_hàng_hổ_trợ NVARCHAR(255),
    Tên_hình_thức NVARCHAR(255)
);
go
CREATE TABLE Coupon(
    ID VARCHAR(50) PRIMARY KEY,
    Loại_coupon NVARCHAR(255),
    Ngày_kết_thúc DATE,
    Ngày_bắt_đầu DATE,
    Tỉ_lệ_giảm FLOAT
);
go
CREATE TABLE Người_dùng_và_người_hỗ_trợ(
    Mã_người_dùng VARCHAR(50),
    Mã_người_hỗ_trợ VARCHAR(50),
    FOREIGN KEY (Mã_người_dùng) REFERENCES Người_dùng(Mã_người_dùng),
    FOREIGN KEY (Mã_người_hỗ_trợ) REFERENCES Người_Hỗ_Trợ(Mã_Người_Hỗ_Trợ)
);
go
CREATE TABLE Người_dùng_và_địa_chỉ(
    Mã_người_dùng VARCHAR(50),
    Mã_Địa_chỉ VARCHAR(50),
    FOREIGN KEY (Mã_người_dùng) REFERENCES Người_dùng(Mã_người_dùng),
    FOREIGN KEY (Mã_Địa_chỉ) REFERENCES Địa_chỉ(ID_Địa_chỉ)
);
go
CREATE TABLE Sách_và_Thể_loại(
    Mã_sách VARCHAR(50),
    Mã_Thể_loại VARCHAR(50),
    FOREIGN KEY (Mã_sách) REFERENCES Sách(Mã_Sách),
    FOREIGN KEY (Mã_Thể_loại) REFERENCES Thể_Loại(Mã_Thể_loại)
);
go
CREATE TABLE Sách_và_tác_giả(
    Mã_Sách VARCHAR(50),
    Mã_tác_giả VARCHAR(50),
    FOREIGN KEY (Mã_Sách) REFERENCES Sách(Mã_Sách),
    FOREIGN KEY (Mã_tác_giả) REFERENCES Tác_giả(ID)
);
go
CREATE TABLE Giỏ_hàng(
    Mã_giỏ_hàng VARCHAR(50) PRIMARY KEY,
    số_lượng INT,
    tên_sản_phẩm NVARCHAR(255),
    chốt_đơn BIT,
    Mã_Sách VARCHAR(50),
    Mã_người_dùng VARCHAR(50),
    FOREIGN KEY (Mã_Sách) REFERENCES Sách(Mã_Sách),
    FOREIGN KEY (Mã_người_dùng) REFERENCES Người_dùng(Mã_người_dùng)
);
go
CREATE TABLE Hóa_đơn(
    Mã_HD VARCHAR(50) PRIMARY KEY,
    Tổng_tiền MONEY,
    Ngày_đặt_hàng DATE,
    ID_coupon VARCHAR(50),
    Mã_giao_hàng VARCHAR(50),
    Mã_Thanh_Toán VARCHAR(50),
    VAT FLOAT,
    ID_người_dùng VARCHAR(50),
    ID_giỏ_hàng VARCHAR(50),
    ID_Địa_chỉ VARCHAR(50),
    giảm_giá CHAR(1),
    FOREIGN KEY (Mã_giao_hàng) REFERENCES Giao_hàng(Mã_giao_hàng),
    FOREIGN KEY (Mã_Thanh_Toán) REFERENCES Phương_thức_thanh_toán(Mã_Thanh_Toán),
    FOREIGN KEY (ID_coupon) REFERENCES Coupon(ID),
    FOREIGN KEY (ID_người_dùng) REFERENCES Người_dùng(Mã_người_dùng),
    FOREIGN KEY (ID_giỏ_hàng) REFERENCES Giỏ_hàng(Mã_giỏ_hàng),
    FOREIGN KEY (ID_Địa_chỉ) REFERENCES Địa_chỉ(ID_Địa_chỉ)
);



drop table Hóa_đơn
