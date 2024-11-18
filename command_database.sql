USE vinabook

--QUERY USING ORDER BY
--In ra thông tin khách hàng theo thứ tự mã khách hàng giảm dần
SELECT * 
FROM Người_dùng
ORDER BY Mã_người_dùng DESC

--QUERY USING INNER JOIN 
--In ra danh sách các cuốn sách (Mã_sách,Tên_sách) được khách hàng có tên “Nguyen Van A” mua trong tháng 12/2023
SELECT S.Mã_Sách, S.Tên_Sách
FROM Sách S
INNER JOIN Danh_sách_vật_phẩm D ON D.Mã_sách = S.Mã_Sách
INNER JOIN Giỏ_hàng G ON D.Mã_giỏ_hàng = G.Mã_giỏ_hàng
INNER JOIN Hóa_đơn H ON H.ID_giỏ_hàng = G.Mã_giỏ_hàng
INNER JOIN Người_dùng N ON N.Mã_người_dùng = H.ID_người_dùng
WHERE Họ_tên = 'Nguyen Van A' 
AND MONTH(Ngày_đặt_hàng) = 12 AND YEAR(Ngày_đặt_hàng) = 2023

--QUERY USING AGGREGATE FUNCTION
--Với từng thể loại, in ra giá bán cao nhất, trung bình, thấp nhất của một cuốn sách
SELECT Mã_Thể_loại, MAX(giá_tiền) AS MAX, AVG(giá_tiền) AS 'AVG', MIN(giá_tiền) AS 'MIN'
FROM Sách S
INNER JOIN Sách_và_Thể_loại T ON S.Mã_Sách = T.Mã_sách
GROUP BY Mã_Thể_loại

--QUERY USING GROUP BY AND HAVING CLAUSE
--In ra mã khách hàng có số lần mua hàng nhiều nhất tháng 12/2023
SELECT Mã_người_dùng, COUNT(Mã_HD) AS 'Số_lần_mua'
FROM Người_dùng N
INNER JOIN Hóa_đơn H ON N.Mã_người_dùng = H.ID_người_dùng
WHERE MONTH(Ngày_đặt_hàng) = 12 AND YEAR(Ngày_đặt_hàng) = 2023
GROUP BY Mã_người_dùng
HAVING COUNT(Mã_HD) >= ALL (SELECT COUNT(Mã_HD)
							FROM Người_dùng N
							INNER JOIN Hóa_đơn H ON N.Mã_người_dùng = H.ID_người_dùng
							WHERE MONTH(Ngày_đặt_hàng) = 12 AND YEAR(Ngày_đặt_hàng) = 2023
							GROUP BY Mã_người_dùng)

--QUERY USING SUB-QUERY AS A RELATION
--In ra danh sách các sách (Mã_sách,Tên_sách) không bán được trong năm 2023
SELECT S1.Mã_Sách, Tên_Sách
FROM Sách S1
WHERE S1.Mã_Sách NOT IN(SELECT S2.Mã_Sách
						FROM Sách S2
						INNER JOIN Danh_sách_vật_phẩm D ON S2.Mã_Sách = D.Mã_sách
						INNER JOIN Giỏ_hàng G ON D.Mã_giỏ_hàng = G.Mã_giỏ_hàng
						INNER JOIN Hóa_đơn H ON G.Mã_giỏ_hàng = H.ID_giỏ_hàng
						WHERE YEAR(Ngày_đặt_hàng) = 2023)
GO
--Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2023
SELECT Họ_tên
FROM Người_dùng N INNER JOIN Hóa_đơn H
ON N.Mã_người_dùng = H.ID_người_dùng 
AND Mã_HD = (SELECT Mã_HD
			FROM Hóa_đơn 
			WHERE Tổng_tiền = (SELECT MAX(Tổng_tiền)
							FROM Hóa_đơn))
--STORE PROCEDURE
--Tham số vào là Họ tên khách hàng, kiểm tra khách hàng đó có tồn tại không, lấy ra thông tin 
--những cuốn sách mà khách hàng đó đã mua
CREATE PROCEDURE GROUP_PROC (@HOTEN NVARCHAR(255))
AS
BEGIN
	IF EXISTS (SELECT Họ_tên FROM Người_dùng WHERE Họ_tên = @HOTEN)
    BEGIN 
        SELECT S.* 
        FROM Sách S
		INNER JOIN Danh_sách_vật_phẩm D ON D.Mã_sách = S.Mã_Sách
		INNER JOIN Giỏ_hàng G ON D.Mã_giỏ_hàng = G.Mã_giỏ_hàng
		INNER JOIN Hóa_đơn H ON G.Mã_giỏ_hàng = H.ID_giỏ_hàng
		INNER JOIN Người_dùng N ON H.ID_người_dùng = N.Mã_người_dùng
        WHERE Họ_tên = @HOTEN
    END
    ELSE
        PRINT N'KHÔNG TỒN TẠI' 
	END
GO
EXECUTE GROUP_PROC @HOTEN = 'Nguyen Van A'
GO

--FUNCTION
--Viết function với tham số vào: Mã sách, Tháng, Năm bất kì. Cho biết doanh thu của cuốn sách trong tháng năm đó
CREATE FUNCTION GROUP02_FUNC(@MASACH VARCHAR(50), @THANG DATETIME, @NAM DATETIME)
RETURNS INT
AS
	BEGIN
		DECLARE @DOANHTHU INT 
		SELECT @DOANHTHU = SUM(D.Thành_tiền)
		FROM Sách S
		INNER JOIN Danh_sách_vật_phẩm D ON D.Mã_sách = S.Mã_Sách
		INNER JOIN Giỏ_hàng G ON D.Mã_giỏ_hàng = G.Mã_giỏ_hàng
		INNER JOIN Hóa_đơn H ON G.Mã_giỏ_hàng = H.ID_giỏ_hàng
		WHERE S.Mã_Sách = @MASACH AND MONTH(Ngày_đặt_hàng) = @THANG AND YEAR(Ngày_đặt_hàng) = @NAM
		GROUP BY S.Mã_Sách
										
		RETURN @DOANHTHU
	END
GO
--THỰC THI
DECLARE @DT INT
SET @DT = DBO.GROUP02_FUNC('S0002', 12, 2023)
PRINT @DT
GO


--TRIGGER
CREATE TRIGGER TRIG2 ON Danh_sách_vật_phẩm FOR UPDATE
AS
BEGIN
	UPDATE DSVP SET DSVP.số_lượng = I.số_lượng
	FROM Danh_sách_vật_phẩm DSVP, DELETED D, INSERTED I
	WHERE DSVP.số_lượng = D.số_lượng AND DSVP.Mã_sách = D.Mã_sách AND DSVP.Mã_giỏ_hàng = D.Mã_giỏ_hàng
END

