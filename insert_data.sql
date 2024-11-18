
--=======================Người Dùng====================--
INSERT INTO Người_dùng (Mã_người_dùng, Họ_tên, Ngày_Sinh, Giới_Tính, Email, Mật_khẩu, vấn_đề)
VALUES 
('ND0001', 'Nguyen Van A', '1990-01-01', 'Nam', 'nguyenvana@example.com', 'password1', N'Vấn đề 1'),
('ND0002', 'Tran Thi B', '1995-01-01', N'Nữ', 'tranthib@example.com', 'password2', N'Vấn đề 2');

INSERT INTO Địa_chỉ (ID_Địa_chỉ, Tên_Địa_chỉ)
VALUES 
('DC0001', N'123 Đường 1, Phường 1, Quận 1, TP.HCM'),
('DC0002', N'456 Đường 2, Phường 2, Quận 2, TP.HCM'),
('DC0003', N'789 Đường 3, Phường 3, Quận 3, TP.HCM');

INSERT INTO Người_Hỗ_Trợ (Mã_Người_Hỗ_Trợ, Thời_Gian, Vấn_đề, Tên_Người_Hỗ_Trợ)
VALUES 
('NHT0001', '08:00:00', N'Vấn đề 1', N'Trần Văn An');

INSERT INTO Người_dùng_và_người_hỗ_trợ (Mã_người_dùng, Mã_người_hỗ_trợ)
VALUES 
('ND0001', 'NHT0001'),
('ND0002', 'NHT0001');

INSERT INTO Người_dùng_và_địa_chỉ (Mã_người_dùng, Mã_Địa_chỉ)
VALUES 
('ND0001', 'DC0001'),
('ND0001', 'DC0002'),
('ND0002', 'DC0003');

--=======================SÁCH=========================--
INSERT INTO Sách (Mã_Sách, Tên_Sách, giá_tiền, ngôn_ngữ, Số_lượng, Ngày_xuất_bản)
VALUES 
('S0001', 'The Midnight Library', 150.00, 'English', 15, '2023-01-01'),
('S0002', 'The Invisible Life of Addie LaRue', 250.00, 'English', 25, '2023-02-01'),
('S0003', 'The Seven Husbands of Evelyn Hugo', 350.00, 'English', 35, '2023-03-01'),
('S0004', 'Life of Pi', 450.00, 'English', 45, '2023-04-01'),
('S0005', 'Sooley', 550.00, 'English', 55, '2023-05-01'),
('S0006', 'Around the World in Eighty Days', 650.00, 'English', 65, '2023-06-01'),
('S0007', 'Joyland', 750.00, 'English', 75, '2023-07-01'),
('S0008', 'Comanche Moon', 850.00, 'English', 85, '2023-08-01'),
('S0009', 'Flashman', 950.00, 'English', 95, '2023-09-01'),
('S0010', 'Royal Flash', 1050.00, 'English', 105, '2023-10-01'),
('S0011', 'Flash for Freedom', 1150.00, 'English', 115, '2023-11-01'),
('S0012', 'Me Before You', 1250.00, 'English', 125, '2023-12-01'),
('S0013', 'After You', 1350.00, 'English', 135, '2024-01-01'),
('S0014', 'Still Me', 1450.00, 'English', 145, '2024-02-01'),
('S0015', 'Paris for One and Other Stories', 1550.00, 'English', 155, '2024-03-01'),
('S0016', 'Cold Granite', 1650.00, 'English', 165, '2024-04-01'),
('S0017', 'Dying Light', 1750.00, 'English', 175, '2024-05-01'),
('S0018', 'Broken Skin', 1850.00, 'English', 185, '2024-06-01'),
('S0019', 'The Girl in the Red Coat', 1950.00, 'English', 195, '2024-07-01'),
('S0020', 'Girl in the Blue Coat', 2050.00, 'English', 205, '2024-08-01'),
('S0021', 'Primates of Park Avenue', 2150.00, 'English', 215, '2024-09-01'),
('S0022', 'The Swans of Fifth Avenue', 2250.00, 'English', 225, '2024-10-01'),
('S0023', 'Life After Life', 2350.00, 'English', 235, '2024-11-01'),
('S0024', 'Joyland', 2450.00, 'English', 245, '2024-12-01'),
('S0025', 'Comanche Moon', 2550.00, 'English', 255, '2025-01-01'),
('S0026', 'Flashman', 2650.00, 'English', 265, '2025-02-01'),
('S0027', 'Royal Flash', 2750.00, 'English', 275, '2025-03-01'),
('S0028', 'Flash for Freedom', 2850.00, 'English', 285, '2025-04-01'),
('S0029', 'Me Before You', 2950.00, 'English', 295, '2025-05-01'),
('S0030', 'After You', 3050.00, 'English', 305, '2025-06-01');



INSERT INTO Thể_Loại (Mã_Thể_loại, Tên_thể_loại)
VALUES 
('TL0001', 'Fantasy'),
('TL0002', 'Historical Fiction'),
('TL0003', 'Adventure Fiction'),
('TL0004', 'Sports Novel'),
('TL0005', 'Mystery'),
('TL0006', 'Crime'),
('TL0007', 'Horror'),
('TL0008', 'Memoir'),
('TL0009', 'Romance');

INSERT INTO Tác_giả (ID, Tên)
VALUES 
('TG0001', 'Matt Haig'),
('TG0002', 'V.E. Schwab'),
('TG0003', 'Taylor Jenkins Reid'),
('TG0004', 'Yann Martel'),
('TG0005', 'John Grisham'),
('TG0006', 'Jules Verne'),
('TG0007', 'Stephen King'),
('TG0008', 'Catherine Anderson'),
('TG0009', 'George MacDonald Fraser'),
('TG0010', 'Jojo Moyes'),
('TG0011', 'Stuart MacBride'),
('TG0012', 'Kate Hamer'),
('TG0013', 'Monica Hesse'),
('TG0014', 'Wednesday Martin'),
('TG0015', 'Melanie Benjamin'),
('TG0016', 'Kate Atkinson');




INSERT INTO Sách_và_Thể_loại (Mã_sách, Mã_Thể_loại)
VALUES 
('S0001', 'TL0001'),
('S0002', 'TL0001'),
('S0003', 'TL0002'),
('S0004', 'TL0003'),
('S0005', 'TL0004'),
('S0006', 'TL0003'),
('S0007', 'TL0005'),
('S0008', 'TL0002'),
('S0009', 'TL0002'),
('S0010', 'TL0002'),
('S0011', 'TL0002'),
('S0012', 'TL0009'),
('S0013', 'TL0009'),
('S0014', 'TL0009'),
('S0015', 'TL0009'),
('S0016', 'TL0005'),
('S0017', 'TL0005'),
('S0018', 'TL0005'),
('S0019', 'TL0005'),
('S0020', 'TL0002'),
('S0021', 'TL0007'),
('S0022', 'TL0002'),
('S0023', 'TL0002'),
('S0024', 'TL0005'),
('S0025', 'TL0002'),
('S0026', 'TL0002'),
('S0027', 'TL0002'),
('S0028', 'TL0002'),
('S0029', 'TL0009'),
('S0030', 'TL0009');

INSERT INTO Sách_và_tác_giả (Mã_Sách, Mã_tác_giả)
VALUES 
('S0001', 'TG0001'),
('S0002', 'TG0002'),
('S0003', 'TG0003'),
('S0004', 'TG0004'),
('S0005', 'TG0005'),
('S0006', 'TG0006'),
('S0007', 'TG0007'),
('S0008', 'TG0008'),
('S0009', 'TG0009'),
('S0010', 'TG0009'),
('S0011', 'TG0009'),
('S0012', 'TG0010'),
('S0013', 'TG0010'),
('S0014', 'TG0010'),
('S0015', 'TG0010'),
('S0016', 'TG0011'),
('S0017', 'TG0011'),
('S0018', 'TG0011'),
('S0019', 'TG0012'),
('S0020', 'TG0013'),
('S0021', 'TG0014'),
('S0022', 'TG0015'),
('S0023', 'TG0016'),
('S0024', 'TG0007'),
('S0025', 'TG0008'),
('S0026', 'TG0009'),
('S0027', 'TG0009'),
('S0028', 'TG0009'),
('S0029', 'TG0010'),
('S0030', 'TG0010');

INSERT INTO Giỏ_hàng (Mã_giỏ_hàng, số_lượng, tên_sản_phẩm, chốt_đơn, Mã_Sách, Mã_người_dùng)
VALUES 
('GH0001', 1, 'The Midnight Library', 1, 'S0001', 'ND0001'),
('GH0002', 2, 'The Invisible Life of Addie LaRue', 1, 'S0002', 'ND0001'),
('GH0003', 4, 'The Seven Husbands of Evelyn Hugo', 1, 'S0003', 'ND0002'),
('GH0004', 2, 'Life of Pi', 1, 'S0004', 'ND0002'),
('GH0005', 1, 'Sooley', 1, 'S0005', 'ND0002');






INSERT INTO Giao_hàng (Mã_giao_hàng, loại, Giá_tiền)
VALUES 
('GH0001', N'Giao hàng tiêu chuẩn', 10.00),
('GH0002', N'Giao hàng nhanh', 20.00),
('GH0003', N'Giao hàng trong ngày', 30.00);

INSERT INTO Phương_thức_thanh_toán (Mã_Thanh_Toán, Ngày_hết_hạn, VAT, Ngân_hàng_hổ_trợ, Tên_hình_thức)
VALUES 
('PTTT0001', '2025-12-31', 0.1, N'Ngân hàng A', N'Thẻ tín dụng'),
('PTTT0002', '2024-11-30', 0.1, N'Ngân hàng B', N'Tiền Mặt')


INSERT INTO Coupon (ID, Loại_coupon, Ngày_kết_thúc, Ngày_bắt_đầu, Tỉ_lệ_giảm)
VALUES 
('CP0001', N'Giảm 10%', '2024-12-31', '2024-01-01', 0.1),
('CP0002', N'Giảm 20%', '2024-11-30', '2024-02-02', 0.2),
('CP0003', N'Giảm 30%', '2024-10-29', '2024-03-03', 0.3);



INSERT INTO Hóa_đơn (Mã_HD, Tổng_tiền, Ngày_đặt_hàng, ID_coupon, Mã_giao_hàng, Mã_Thanh_Toán, VAT, ID_người_dùng, ID_giỏ_hàng, ID_Địa_chỉ, giảm_giá)
VALUES 
('HD0001', 150.00, '2023-12-10', 'CP0001', 'GH0001', 'PTTT0001', 0.1, 'ND0001', 'GH0001', 'DC0001', 'T'),
('HD0002', 550.00, '2023-12-11', 'CP0002', 'GH0002', 'PTTT0002', 0.1, 'ND0002', 'GH0002', 'DC0002', 'F');

SELECT * FROM Người_dùng;
SELECT * FROM Địa_chỉ;
SELECT * FROM Người_Hỗ_Trợ;
SELECT * FROM Tác_giả;
SELECT * FROM Sách;
SELECT * FROM Thể_Loại;
SELECT * FROM Giao_hàng;
SELECT * FROM Phương_thức_thanh_toán;
SELECT * FROM Coupon;
SELECT * FROM Người_dùng_và_người_hỗ_trợ;
SELECT * FROM Người_dùng_và_địa_chỉ;
SELECT * FROM Sách_và_Thể_loại;
SELECT * FROM Sách_và_tác_giả;
SELECT * FROM Giỏ_hàng;
SELECT * FROM Hóa_đơn;

DROP TABLE Hóa_đơn;
DROP TABLE Giỏ_hàng;
DROP TABLE Sách_và_tác_giả;
DROP TABLE Sách_và_Thể_loại;
DROP TABLE Người_dùng_và_địa_chỉ;
DROP TABLE Người_dùng_và_người_hỗ_trợ;
DROP TABLE Coupon;
DROP TABLE Phương_thức_thanh_toán;
DROP TABLE Giao_hàng;
DROP TABLE Thể_Loại;
DROP TABLE Sách;
DROP TABLE Tác_giả;
DROP TABLE Người_Hỗ_Trợ;
DROP TABLE Địa_chỉ;
DROP TABLE Người_dùng;
