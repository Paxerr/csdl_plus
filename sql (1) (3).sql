create database quanLiDatPhong
go

use quanLiDatPhong
go

--create table & index
CREATE TABLE KhachHang (
    MaKhachHang INT IDENTITY(1,1) PRIMARY KEY,  -- Clustered index mặc định trên PK
    TenKhachHang NVARCHAR(100) NOT NULL,
    HoKhachHang NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(20) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    MaCccd VARCHAR(50),
    NgayTao DATETIME DEFAULT GETDATE()
);

-- Nonclustered index trên SoDienThoai
CREATE NONCLUSTERED INDEX idx_KhachHang_SoDienThoai
ON KhachHang(SoDienThoai);

-- Nonclustered index trên Email
CREATE NONCLUSTERED INDEX idx_KhachHang_Email
ON KhachHang(Email);

-- Tạo bảng Phong
CREATE TABLE Phong (
    MaPhong INT IDENTITY(1,1) PRIMARY KEY,  -- Clustered index mặc định trên PK
    LoaiPhong NVARCHAR(50) NOT NULL,
    GiaPhong DECIMAL(18,2) NOT NULL,
    TrangThai NVARCHAR(50) NOT NULL,  -- Ví dụ: 'Trống', 'Đang đặt', 'Đang sử dụng', 'Bảo trì'
    MoTa NVARCHAR(500)
);

-- Nonclustered index trên LoaiPhong
CREATE NONCLUSTERED INDEX idx_Phong_LoaiPhong
ON Phong(LoaiPhong);

-- Nonclustered index trên TrangThai
CREATE NONCLUSTERED INDEX idx_Phong_TrangThai
ON Phong(TrangThai);

-- Nonclustered index trên GiaPhong
CREATE NONCLUSTERED INDEX idx_Phong_GiaPhong
ON Phong(GiaPhong);


-- Tạo bảng HoaDon 
CREATE TABLE HoaDon (
    MaHoaDon INT IDENTITY(1,1) PRIMARY KEY,  -- Clustered index mặc định trên PK
    MaKhachHang INT NOT NULL,
    TongHoaDon DECIMAL(18,2) NOT NULL,
    TrangThai NVARCHAR(50) NOT NULL,  -- Ví dụ: 'Đang xử lý', 'Hoàn tất', 'Hủy'
    PhuongThuc NVARCHAR(50) NOT NULL,  -- Ví dụ: 'Tiền mặt', 'Chuyển khoản', 'Thẻ'
    NgayThanhToan DATETIME,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

-- Nonclustered index trên MaKhachHang
CREATE NONCLUSTERED INDEX idx_HoaDon_MaKhachHang
ON HoaDon(MaKhachHang);

-- Nonclustered index trên NgayThanhToan
CREATE NONCLUSTERED INDEX idx_HoaDon_NgayThanhToan
ON HoaDon(NgayThanhToan);

-- Nonclustered index trên PhuongThuc
CREATE NONCLUSTERED INDEX idx_HoaDon_PhuongThuc
ON HoaDon(PhuongThuc);

-- Tạo bảng DatPhong
CREATE TABLE DatPhong (
    MaDatPhong INT IDENTITY(1,1) PRIMARY KEY,  -- Clustered index mặc định trên PK
    MaKhachHang INT NOT NULL,
    MaPhong INT NOT NULL,
    NgayDat DATETIME NOT NULL,
    NgayTra DATETIME NOT NULL,
    MaHoaDon INT NULL,  -- NULL khi chưa thanh toán
    DatCoc DECIMAL(18,2) DEFAULT 0,
    TrangThai NVARCHAR(50) NOT NULL,  -- Ví dụ: 'Đã đặt', 'Hủy', 'Check-in', 'Check-out'
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong),
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon)
);

-- Nonclustered index trên MaKhachHang
CREATE NONCLUSTERED INDEX idx_DatPhong_MaKhachHang
ON DatPhong(MaKhachHang);

-- Nonclustered index trên NgayDat
CREATE NONCLUSTERED INDEX idx_DatPhong_NgayDat
ON DatPhong(NgayDat);

-- Nonclustered index trên MaPhong
CREATE NONCLUSTERED INDEX idx_DatPhong_MaPhong
ON DatPhong(MaPhong);




--insert data

-- KhachHang
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Phạm', '0343321819', 'tupham1@example.com', '600133890838', '2024-03-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Lý', '0540265423', 'kienly2@example.com', '511615594078', '2023-05-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Lê', '0549593103', 'ngocle3@example.com', '413164752553', '2024-11-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Lê', '0528327648', 'longle4@example.com', '350305641395', '2023-08-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Trịnh', '0872423884', 'tungtrinh5@example.com', '969653287101', '2023-06-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Huỳnh', '0891669784', 'tuhuynh6@example.com', '801845146270', '2025-09-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Yến', 'Đặng', '0528148932', 'yendang7@example.com', '528809570154', '2023-09-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Vũ', '0511718227', 'dungvu8@example.com', '824896383465', '2024-03-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Lý', '0333150983', 'thaoly9@example.com', '930103105183', '2023-10-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Trịnh', '0982997376', 'vantrinh10@example.com', '311656670106', '2025-01-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Phạm', '0933872624', 'ngocpham11@example.com', '731781080132', '2024-02-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Trịnh', '0960260647', 'quynhtrinh12@example.com', '468723430980', '2025-02-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Trần', '0397882081', 'namtran13@example.com', '219136193990', '2024-09-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hải', 'Dương', '0598543534', 'haiduong14@example.com', '624751079911', '2024-07-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khánh', 'Hà', '0725135427', 'khanhha15@example.com', '849808412411', '2025-01-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Hoàng', '0749353487', 'tranghoang16@example.com', '401640052427', '2024-07-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Dương', '0501128059', 'vuduong17@example.com', '826204505331', '2023-12-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Dương', '0523226025', 'trangduong18@example.com', '634216073375', '2023-11-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Vũ', '0336541458', 'kienvu19@example.com', '685014294019', '2024-03-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Đỗ', '0898169340', 'nhatdo20@example.com', '608835615951', '2025-01-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Minh', 'Hà', '0765648236', 'minhha21@example.com', '629946804436', '2025-03-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trinh', 'Trần', '0777738721', 'trinhtran22@example.com', '489513433200', '2023-09-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Trần', '0376936763', 'quangtran23@example.com', '201632870831', '2024-04-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Lý', '0589579868', 'haly24@example.com', '727743487347', '2023-03-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Bùi', '0945581223', 'vubui25@example.com', '623166587603', '2025-05-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Ngô', '0509670546', 'nhungo26@example.com', '688937346706', '2023-12-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Ngô', '0972980699', 'vanngo27@example.com', '016272046537', '2023-12-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Ngô', '0764170805', 'ngocngo28@example.com', '310033092327', '2024-11-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Lưu', '0974529912', 'hanhluu29@example.com', '419049663193', '2023-04-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Bùi', '0519058651', 'vietbui30@example.com', '850671657262', '2025-01-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Đặng', '0587769453', 'thaodang31@example.com', '147379965075', '2023-07-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Phan', '0745494808', 'quynhphan32@example.com', '313678377701', '2023-10-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Ngô', '0949578856', 'kienngo33@example.com', '855744431351', '2025-01-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Huỳnh', '0937498941', 'tienhuynh34@example.com', '343524082400', '2024-07-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Mai', 'Hoàng', '0810947775', 'maihoang35@example.com', '204711671902', '2023-06-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Bùi', '0331869993', 'trambui36@example.com', '867749649909', '2025-09-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Phan', '0941232812', 'haphan37@example.com', '067974034471', '2024-12-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Đặng', '0536183242', 'kiendang38@example.com', '102499471746', '2025-08-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Hà', '0577190659', 'longha39@example.com', '401399049027', '2024-06-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Lý', '0729671756', 'tungly40@example.com', '551256746807', '2023-04-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Đặng', '0716808760', 'namdang41@example.com', '385977034824', '2024-03-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Trịnh', '0309324808', 'viettrinh42@example.com', '613171274846', '2025-05-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Trịnh', '0978263982', 'quangtrinh43@example.com', '146584044997', '2025-06-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Lý', '0575588675', 'huongly44@example.com', '339636057662', '2024-05-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Hoàng', '0595171870', 'chihoang45@example.com', '262174596158', '2024-01-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Trịnh', '0509134316', 'namtrinh46@example.com', '117240050455', '2024-03-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Vũ', '0569222196', 'huongvu47@example.com', '937923747407', '2025-07-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Mai', 'Võ', '0917594647', 'maivo48@example.com', '436713695944', '2023-01-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Ngô', '0709097439', 'vanngo49@example.com', '533942104709', '2024-01-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Yến', 'Hoàng', '0345623285', 'yenhoang50@example.com', '884247451712', '2025-02-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Ngô', '0551604817', 'kienngo51@example.com', '549651370985', '2025-07-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn Anh', 'Vũ', '0374612004', 'tuananhvu52@example.com', '711382675869', '2025-01-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Yến', 'Hoàng', '0817964053', 'yenhoang53@example.com', '773515850643', '2023-05-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Lê', '0990053293', 'phucle54@example.com', '183933529042', '2023-05-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Đặng', '0910205395', 'tiendang55@example.com', '024026811775', '2024-06-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trinh', 'Phạm', '0883908470', 'trinhpham56@example.com', '076617711592', '2023-03-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Đặng', '0598569847', 'hadang57@example.com', '896118367365', '2025-04-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Ngô', '0815654527', 'phucngo58@example.com', '111161528098', '2024-07-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Phạm', '0856049451', 'ngocpham59@example.com', '983273158514', '2024-08-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Dương', '0599809402', 'kienduong60@example.com', '445502296120', '2023-04-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Phan', '0867525459', 'thaophan61@example.com', '910229014767', '2024-09-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Dương', '0738156149', 'phuongduong62@example.com', '784036900343', '2025-02-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Đặng', '0751076226', 'hadang63@example.com', '838851606071', '2025-06-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Lưu', '0896641605', 'namluu64@example.com', '297516136968', '2023-03-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Bùi', '0735218188', 'nguyetbui65@example.com', '355231243292', '2025-02-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Lê', '0977997995', 'tungle66@example.com', '527177449058', '2023-03-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Minh', 'Lý', '0800541199', 'minhly67@example.com', '867980793597', '2024-05-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Trần', '0815182037', 'huongtran68@example.com', '788925546659', '2023-02-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Đỗ', '0351864492', 'tudo69@example.com', '519254629148', '2024-01-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Đỗ', '0981685054', 'tungdo70@example.com', '235733221418', '2025-02-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Hà', '0359296222', 'tienha71@example.com', '927065379473', '2024-06-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Bùi', '0835977468', 'lanbui72@example.com', '862392407581', '2024-12-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Phạm', '0712478261', 'thaopham73@example.com', '375060685361', '2024-01-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Nguyễn', '0715220472', 'kiennguyen74@example.com', '779010432898', '2024-03-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Bùi', '0941036971', 'hanhbui75@example.com', '179808932460', '2024-09-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Vũ', '0562185188', 'nhatvu76@example.com', '888067065405', '2025-03-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dương', 'Hồ', '0919520585', 'duongho77@example.com', '277221704303', '2025-06-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Đỗ', '0786874034', 'chido78@example.com', '505415667652', '2024-05-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Trịnh', '0784161692', 'viettrinh79@example.com', '845115447962', '2024-12-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Hồ', '0805964016', 'phuongho80@example.com', '582029702135', '2024-01-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Lưu', '0392755719', 'ngocluu81@example.com', '285654310278', '2024-02-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Phạm', '0747394731', 'trangpham82@example.com', '217271551884', '2025-07-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Minh', 'Huỳnh', '0958313237', 'minhhuynh83@example.com', '058957829114', '2024-02-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Trịnh', '0566912517', 'vutrinh84@example.com', '785289226801', '2024-06-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Bùi', '0925358414', 'huongbui85@example.com', '384249818299', '2023-06-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Trần', '0559001094', 'huytran86@example.com', '396907844736', '2023-11-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Lê', '0327677359', 'phucle87@example.com', '255562588153', '2024-04-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Đặng', '0832104696', 'hanhdang88@example.com', '325953278774', '2024-05-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Lê', '0887339500', 'baole89@example.com', '479748016245', '2025-02-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Hồ', '0360983584', 'nguyetho90@example.com', '168784991216', '2024-01-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Võ', '0723986800', 'ngocvo91@example.com', '025787298259', '2023-11-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Ngô', '0549588879', 'huyngo92@example.com', '470551694097', '2023-09-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Lưu', '0530972896', 'tungluu93@example.com', '230913075626', '2024-12-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khánh', 'Dương', '0597028385', 'khanhduong94@example.com', '786527858549', '2024-05-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Vũ', '0784344375', 'khanhvu95@example.com', '758441986652', '2023-10-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Bùi', '0357473384', 'chibui96@example.com', '842199330833', '2023-02-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Dương', '0771208267', 'haduong97@example.com', '734540193802', '2024-03-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huyền', 'Trần', '0872400499', 'huyentran98@example.com', '154788728743', '2025-04-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Đỗ', '0974205493', 'hanhdo99@example.com', '296685161227', '2023-11-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Nguyễn', '0763745499', 'lannguyen100@example.com', '045301742684', '2024-12-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Bùi', '0793327279', 'hanhbui101@example.com', '568783391878', '2024-12-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Lê', '0510883982', 'ngale102@example.com', '258713971870', '2024-04-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Hà', '0879087406', 'haha103@example.com', '403910651801', '2025-08-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Trần', '0762265676', 'quangtran104@example.com', '618251286823', '2025-05-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Nguyễn', '0778686337', 'anhnguyen105@example.com', '524310690331', '2023-04-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Trần', '0890306738', 'tuantran106@example.com', '302843959953', '2023-11-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Hà', '0964408926', 'huongha107@example.com', '870568566246', '2023-07-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Trịnh', '0934270866', 'tientrinh108@example.com', '882634351751', '2024-07-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Yến', 'Phan', '0346990139', 'yenphan109@example.com', '837354033173', '2024-12-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Phan', '0838546785', 'tuanphan110@example.com', '445877175355', '2024-02-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Lưu', '0920489964', 'chiluu111@example.com', '235369378547', '2025-01-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Trịnh', '0825228728', 'tungtrinh112@example.com', '080100623120', '2023-08-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Sơn', 'Lý', '0709977008', 'sonly113@example.com', '860084840862', '2023-04-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Hà', '0933984546', 'haha114@example.com', '156793341016', '2024-01-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Võ', '0800217659', 'ngocvo115@example.com', '180339740148', '2024-07-31');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Trần', '0950392614', 'vantran116@example.com', '293968562185', '2023-02-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Dương', '0915999650', 'haduong117@example.com', '477358662961', '2025-03-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn Anh', 'Bùi', '0911426265', 'tuananhbui118@example.com', '511047541212', '2024-03-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Võ', '0586101581', 'phuongvo119@example.com', '995604661839', '2024-06-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Ngô', '0924447212', 'huyngo120@example.com', '646471543799', '2023-07-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Phạm', '0940659657', 'phucpham121@example.com', '569245937526', '2023-11-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Mai', 'Trịnh', '0535646519', 'maitrinh122@example.com', '398280737416', '2024-11-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Hoàng', '0734266179', 'quynhhoang123@example.com', '796886805891', '2023-04-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Hồ', '0990965610', 'lanho124@example.com', '143888993756', '2024-04-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Lưu', '0525071461', 'vyluu125@example.com', '125457387571', '2024-03-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Yến', 'Lý', '0714010512', 'yenly126@example.com', '382825867362', '2023-07-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Dương', '0809379660', 'tuduong127@example.com', '334191825537', '2023-04-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Linh', 'Trịnh', '0559696915', 'linhtrinh128@example.com', '579249912513', '2023-11-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Huỳnh', '0728669296', 'hanhhuynh129@example.com', '627828274225', '2025-05-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Trần', '0350723688', 'phuongtran130@example.com', '767677219034', '2023-02-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Vũ', '0542797881', 'longvu131@example.com', '914858078361', '2025-01-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Vũ', '0707451713', 'tungvu132@example.com', '395962923309', '2023-12-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Đặng', '0582544948', 'tiendang133@example.com', '126042232536', '2024-05-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Lưu', '0766711684', 'huongluu134@example.com', '577590175186', '2023-08-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Phan', '0845458929', 'nhatphan135@example.com', '750017012770', '2025-09-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Phan', '0942415415', 'nhatphan136@example.com', '206436110371', '2023-05-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trinh', 'Vũ', '0570051627', 'trinhvu137@example.com', '136111554262', '2024-10-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Hoàng', '0389092753', 'vyhoang138@example.com', '269731121965', '2024-03-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Hoàng', '0941389994', 'namhoang139@example.com', '043898364037', '2024-01-31');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Vũ', '0891805526', 'hanhvu140@example.com', '965827109104', '2023-08-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Trần', '0884866618', 'chitran141@example.com', '892414183285', '2024-02-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trinh', 'Lê', '0763031617', 'trinhle142@example.com', '990421020275', '2024-06-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Đặng', '0952410564', 'thaodang143@example.com', '814917785079', '2023-06-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Huỳnh', '0719138000', 'ngahuynh144@example.com', '307562208635', '2023-09-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Đỗ', '0719518023', 'nhudo145@example.com', '806174451870', '2024-01-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Bùi', '0549375973', 'khanhbui146@example.com', '832060385050', '2025-02-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Ngô', '0713836702', 'vanngo147@example.com', '410386571918', '2023-05-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Ngô', '0399062344', 'tungo148@example.com', '565574313291', '2023-06-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Huỳnh', '0875618537', 'hahuynh149@example.com', '474112490352', '2023-04-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Vũ', '0768044206', 'vuvu150@example.com', '788317121003', '2023-05-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Ngô', '0719941013', 'khanhngo151@example.com', '721510702966', '2024-05-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Ngô', '0825324472', 'baongo152@example.com', '099934768701', '2023-10-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Hoàng', '0838380657', 'ngochoang153@example.com', '875985642059', '2023-08-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Đặng', '0378593213', 'baodang154@example.com', '348039652239', '2023-11-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Hồ', '0505992937', 'vietho155@example.com', '842701039308', '2024-05-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Đỗ', '0532525002', 'anhdo156@example.com', '921851569154', '2023-11-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Huỳnh', '0875289539', 'hahuynh157@example.com', '264422096902', '2024-09-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Trần', '0991725135', 'namtran158@example.com', '521570433154', '2025-03-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Nguyễn', '0367626765', 'hanguyen159@example.com', '861793271040', '2023-11-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Linh', 'Phạm', '0352621815', 'linhpham160@example.com', '997062962015', '2023-07-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Dương', '0584443106', 'khanhduong161@example.com', '987205061497', '2023-07-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Nguyễn', '0924171467', 'hanguyen162@example.com', '741862565270', '2023-09-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Lý', '0734902115', 'phuongly163@example.com', '869380686879', '2025-06-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Trịnh', '0716089899', 'lantrinh164@example.com', '217223320616', '2023-07-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Hoàng', '0545116868', 'tuhoang165@example.com', '548709986162', '2023-06-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Lưu', '0511914856', 'tramluu166@example.com', '467997024629', '2024-09-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Ngô', '0365307450', 'vyngo167@example.com', '544471324754', '2025-01-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Trần', '0337367850', 'nhutran168@example.com', '821486289023', '2025-06-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Trần', '0907053457', 'khanhtran169@example.com', '861035797279', '2024-07-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Hồ', '0941406029', 'nhatho170@example.com', '333346800722', '2024-09-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Vũ', '0794466574', 'anhvu171@example.com', '374896910858', '2024-10-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Trần', '0741715454', 'tuantran172@example.com', '443283096520', '2024-11-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Bùi', '0766609935', 'quynhbui173@example.com', '387584282417', '2023-05-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Linh', 'Võ', '0951353465', 'linhvo174@example.com', '549471709991', '2024-04-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Hà', '0368460223', 'khanhha175@example.com', '569725217525', '2024-10-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Nguyễn', '0843292712', 'dungnguyen176@example.com', '966667600835', '2025-08-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Đỗ', '0530033542', 'anhdo177@example.com', '168942104478', '2024-09-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Đỗ', '0825753260', 'thaodo178@example.com', '332309821506', '2025-06-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Đặng', '0590901001', 'tudang179@example.com', '676184723046', '2024-11-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Hà', '0799261891', 'haha180@example.com', '411739348356', '2023-10-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Trần', '0573753001', 'huytran181@example.com', '197218114374', '2023-09-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Trần', '0320455611', 'phuctran182@example.com', '002255794155', '2023-07-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Ngô', '0874676212', 'hanhngo183@example.com', '021697972965', '2024-09-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Hoàng', '0871670145', 'baohoang184@example.com', '089935889163', '2024-05-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Ngô', '0989002877', 'nhatngo185@example.com', '217535408386', '2024-02-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Lê', '0879717751', 'lanle186@example.com', '701660880199', '2024-10-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Minh', 'Hà', '0537550375', 'minhha187@example.com', '899757113055', '2025-04-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Bùi', '0585102726', 'tubui188@example.com', '149331637351', '2025-02-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Trần', '0517798270', 'nhutran189@example.com', '808697829221', '2024-02-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Trần', '0558669346', 'vantran190@example.com', '547226984858', '2024-10-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khánh', 'Phan', '0994522885', 'khanhphan191@example.com', '158799684608', '2023-04-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Ngô', '0900342442', 'baongo192@example.com', '043805719838', '2024-02-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Hà', '0706665800', 'lanha193@example.com', '439735989334', '2024-04-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huyền', 'Lê', '0928160648', 'huyenle194@example.com', '422940572025', '2024-09-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Trần', '0779851583', 'dungtran195@example.com', '281826886153', '2025-06-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khánh', 'Đỗ', '0754398780', 'khanhdo196@example.com', '157399305616', '2023-09-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Bùi', '0385887704', 'tienbui197@example.com', '358112880133', '2025-06-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Dương', '0338612075', 'vyduong198@example.com', '011024819346', '2024-02-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Ngô', '0850618091', 'phuongngo199@example.com', '901581449147', '2024-01-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Nguyễn', '0828326842', 'nguyetnguyen200@example.com', '450882100996', '2024-07-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Lê', '0735368222', 'trangle201@example.com', '394312908781', '2023-10-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Lê', '0713975523', 'vanle202@example.com', '149135775949', '2023-06-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Lưu', '0756205336', 'tramluu203@example.com', '452577754781', '2023-06-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Trần', '0342834110', 'tungtran204@example.com', '809969308488', '2024-04-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Hoàng', '0763942788', 'tunghoang205@example.com', '165803928272', '2023-07-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Lưu', '0975037314', 'tramluu206@example.com', '530385677005', '2023-04-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Hà', '0749892665', 'vuha207@example.com', '918463865577', '2025-06-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Nguyễn', '0527231843', 'tuannguyen208@example.com', '222591365177', '2024-05-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khánh', 'Lưu', '0960302992', 'khanhluu209@example.com', '280920242869', '2024-07-31');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Nguyễn', '0713797723', 'tunguyen210@example.com', '692929842579', '2024-08-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dương', 'Vũ', '0862103886', 'duongvu211@example.com', '291279908811', '2024-05-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Hoàng', '0580686508', 'vanhoang212@example.com', '637659916247', '2025-02-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Lê', '0798643009', 'kienle213@example.com', '818063565126', '2024-10-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trinh', 'Đặng', '0786959463', 'trinhdang214@example.com', '688725887449', '2023-12-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Ngô', '0913721386', 'vungo215@example.com', '589026012796', '2023-04-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dương', 'Đặng', '0951906698', 'duongdang216@example.com', '490277038430', '2025-03-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Hà', '0539205302', 'tuanha217@example.com', '146566938011', '2024-07-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Mai', 'Võ', '0555439376', 'maivo218@example.com', '904268181845', '2025-08-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Hà', '0789476973', 'hanhha219@example.com', '577907141633', '2025-03-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Dương', '0788043416', 'namduong220@example.com', '518275539423', '2024-05-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Vũ', '0943333952', 'khanhvu221@example.com', '111790807595', '2024-05-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Đặng', '0828463920', 'tramdang222@example.com', '867808562718', '2024-04-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Nguyễn', '0336915594', 'namnguyen223@example.com', '284347955276', '2023-08-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Hồ', '0764729293', 'nhuho224@example.com', '143866322702', '2024-03-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Hoàng', '0585744890', 'quynhhoang225@example.com', '612034717545', '2024-01-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Võ', '0750615939', 'trangvo226@example.com', '982455877169', '2023-10-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Hoàng', '0956996112', 'phuchoang227@example.com', '535544964759', '2024-06-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Dương', '0920234132', 'phuongduong228@example.com', '611178006811', '2023-09-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn Anh', 'Hoàng', '0364334722', 'tuananhhoang229@example.com', '820055778487', '2023-05-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Võ', '0999796884', 'vietvo230@example.com', '578317456424', '2023-01-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Hà', '0954780774', 'anhha231@example.com', '064930853686', '2024-02-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Huỳnh', '0863416389', 'lanhuynh232@example.com', '448463122417', '2024-09-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Đặng', '0573502080', 'phuongdang233@example.com', '214427031207', '2023-08-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Dương', '0775705120', 'ngocduong234@example.com', '461872346013', '2024-01-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Vũ', '0337183764', 'phuongvu235@example.com', '520881474350', '2025-06-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Phan', '0336502491', 'vanphan236@example.com', '630097925132', '2024-05-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hải', 'Trần', '0700528127', 'haitran237@example.com', '358573065240', '2024-05-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Lý', '0548739285', 'vuly238@example.com', '574982182744', '2024-07-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Lý', '0386209593', 'ngaly239@example.com', '518638782945', '2024-02-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Đỗ', '0318102203', 'tungdo240@example.com', '173109678994', '2023-02-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Vũ', '0510371705', 'ngavu241@example.com', '865094801413', '2025-09-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Phạm', '0338633839', 'thaopham242@example.com', '288619576122', '2024-07-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Hà', '0728975585', 'nguyetha243@example.com', '566593983684', '2024-01-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Lý', '0800490824', 'phuongly244@example.com', '043350488899', '2023-06-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Trần', '0852245933', 'hatran245@example.com', '441969315727', '2025-04-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Lưu', '0394096105', 'vietluu246@example.com', '566139060480', '2023-11-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Lưu', '0958320679', 'tienluu247@example.com', '981364622517', '2024-08-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Võ', '0841686227', 'dungvo248@example.com', '837693898331', '2023-09-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Đỗ', '0511665535', 'nhatdo249@example.com', '590425979270', '2025-08-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Phan', '0721103924', 'kienphan250@example.com', '051477053833', '2024-07-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Đặng', '0579206980', 'thaodang251@example.com', '420439407016', '2024-11-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Hồ', '0304636815', 'longho252@example.com', '798123878003', '2025-08-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Bùi', '0776205554', 'thaobui253@example.com', '384046084325', '2025-07-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Hoàng', '0368936392', 'nguyethoang254@example.com', '649578232983', '2025-06-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Bùi', '0526292518', 'habui255@example.com', '812520566474', '2023-06-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Phạm', '0920994999', 'khanhpham256@example.com', '393305172897', '2024-12-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Hồ', '0967722330', 'tungho257@example.com', '604633312797', '2024-12-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Lý', '0966096569', 'namly258@example.com', '998808177038', '2024-07-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Trần', '0568034764', 'nguyettran259@example.com', '472649082771', '2025-01-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Sơn', 'Phạm', '0998266570', 'sonpham260@example.com', '279371452111', '2024-12-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Hồ', '0386892686', 'phuongho261@example.com', '025922220644', '2025-01-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Bùi', '0912309407', 'phuongbui262@example.com', '778097339776', '2024-03-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hải', 'Trần', '0503849830', 'haitran263@example.com', '220502099451', '2023-02-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Dương', '0924999827', 'haduong264@example.com', '950145561681', '2023-10-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Hoàng', '0345868339', 'quanghoang265@example.com', '019817946954', '2024-06-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Trần', '0729978772', 'tramtran266@example.com', '934301071396', '2024-02-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Đỗ', '0783034414', 'chido267@example.com', '488501556990', '2025-05-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huyền', 'Phan', '0757702727', 'huyenphan268@example.com', '857608495880', '2023-08-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Đỗ', '0712405682', 'tramdo269@example.com', '996291450461', '2024-05-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Hồ', '0843842150', 'lanho270@example.com', '317807823578', '2023-11-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Hoàng', '0382307681', 'namhoang271@example.com', '040915701840', '2024-08-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Minh', 'Phan', '0733448571', 'minhphan272@example.com', '422410988138', '2023-12-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Đỗ', '0724932149', 'trangdo273@example.com', '587020701601', '2024-03-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Huỳnh', '0597954538', 'nguyethuynh274@example.com', '179217174773', '2025-08-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Hoàng', '0545625577', 'kienhoang275@example.com', '017157724599', '2023-05-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Sơn', 'Phạm', '0815814876', 'sonpham276@example.com', '963938276153', '2025-04-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Lưu', '0869583219', 'vietluu277@example.com', '719975817246', '2023-03-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Phạm', '0565701329', 'tuanpham278@example.com', '022784699733', '2024-11-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Bùi', '0546519098', 'nambui279@example.com', '624058008514', '2025-06-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Vũ', '0896566668', 'baovu280@example.com', '327238656242', '2023-05-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Lê', '0327621267', 'anhle281@example.com', '969278687653', '2023-07-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Trần', '0397384689', 'nhattran282@example.com', '500975197128', '2025-05-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Lý', '0518913718', 'longly283@example.com', '949058077879', '2025-01-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Dương', '0744209494', 'ngocduong284@example.com', '079290490471', '2023-05-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Sơn', 'Lê', '0742944401', 'sonle285@example.com', '929275243728', '2025-06-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Đỗ', '0329276637', 'chido286@example.com', '239504102767', '2023-11-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Võ', '0966742860', 'quangvo287@example.com', '476580185694', '2023-12-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Đặng', '0349673938', 'longdang288@example.com', '525800106181', '2024-12-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Hồ', '0944300910', 'phuongho289@example.com', '939111926921', '2024-12-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huyền', 'Đặng', '0771746542', 'huyendang290@example.com', '140665044271', '2024-05-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Trần', '0827128639', 'khanhtran291@example.com', '174101194707', '2023-06-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Nguyễn', '0364256908', 'tungnguyen292@example.com', '776618306719', '2024-07-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Đỗ', '0760158517', 'nhatdo293@example.com', '432806346157', '2023-03-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Lý', '0920309376', 'tuly294@example.com', '184787005050', '2024-02-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Phan', '0578293102', 'hanhphan295@example.com', '707903202041', '2024-04-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn Anh', 'Huỳnh', '0511179931', 'tuananhhuynh296@example.com', '365651982530', '2024-08-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huyền', 'Đỗ', '0314262582', 'huyendo297@example.com', '739021962071', '2023-01-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Huỳnh', '0394672324', 'anhhuynh298@example.com', '876329092791', '2024-10-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Minh', 'Hồ', '0808331819', 'minhho299@example.com', '588373403127', '2024-05-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huyền', 'Huỳnh', '0305436459', 'huyenhuynh300@example.com', '701082207811', '2025-07-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Lý', '0595635315', 'lanly301@example.com', '313636317970', '2025-06-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Hoàng', '0997265273', 'nhathoang302@example.com', '543520904217', '2024-04-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Huỳnh', '0734929298', 'nhuhuynh303@example.com', '316873977406', '2025-01-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Vũ', '0769392906', 'lanvu304@example.com', '007806867177', '2023-09-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hải', 'Võ', '0363254310', 'haivo305@example.com', '742799077262', '2025-03-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Lý', '0316580464', 'ngaly306@example.com', '989319508501', '2024-01-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Lý', '0505528183', 'ngaly307@example.com', '253817933554', '2024-05-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Dương', '0701557788', 'vyduong308@example.com', '178847951371', '2023-03-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Huỳnh', '0711241272', 'nguyethuynh309@example.com', '380468275670', '2023-10-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Lê', '0338569557', 'khanhle310@example.com', '988774924243', '2024-05-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Bùi', '0325472928', 'ngabui311@example.com', '422223105927', '2023-09-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Huỳnh', '0980552578', 'ngahuynh312@example.com', '284106727520', '2025-01-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Hà', '0747492975', 'tienha313@example.com', '170281406937', '2024-01-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hải', 'Đỗ', '0393983430', 'haido314@example.com', '187186375998', '2025-08-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Hồ', '0826565045', 'dungho315@example.com', '547813767426', '2025-01-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Hoàng', '0591234785', 'nhuhoang316@example.com', '196106462879', '2025-02-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Phan', '0964870494', 'haphan317@example.com', '787300244714', '2024-03-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huyền', 'Trịnh', '0901471959', 'huyentrinh318@example.com', '796471589042', '2024-08-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Hoàng', '0772520456', 'dunghoang319@example.com', '504481832192', '2024-07-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Đỗ', '0745189520', 'namdo320@example.com', '284576521328', '2023-08-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Võ', '0588816711', 'khanhvo321@example.com', '207545279852', '2024-12-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Minh', 'Nguyễn', '0332234232', 'minhnguyen322@example.com', '161107603108', '2024-08-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Trịnh', '0340140119', 'dungtrinh323@example.com', '393250124955', '2023-06-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Sơn', 'Trần', '0989119083', 'sontran324@example.com', '342801387592', '2024-03-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Phạm', '0956638361', 'vypham325@example.com', '517182754801', '2023-12-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Phạm', '0847947386', 'quynhpham326@example.com', '463175207167', '2024-06-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Lê', '0326691215', 'vanle327@example.com', '353961367499', '2023-10-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Ngô', '0779678427', 'tungngo328@example.com', '114773201017', '2024-11-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Huỳnh', '0895249911', 'baohuynh329@example.com', '877347784858', '2024-07-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Trần', '0816756770', 'baotran330@example.com', '028427624671', '2024-08-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Trịnh', '0589778280', 'vytrinh331@example.com', '647969545009', '2023-02-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Hồ', '0790561655', 'haho332@example.com', '650333491141', '2023-12-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Nguyễn', '0550769864', 'huynguyen333@example.com', '079056965917', '2023-04-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Phan', '0778529456', 'vietphan334@example.com', '371834404963', '2024-10-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hải', 'Lưu', '0395419876', 'hailuu335@example.com', '351484685366', '2023-09-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn Anh', 'Hà', '0882082973', 'tuananhha336@example.com', '748969083572', '2023-09-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Bùi', '0865136442', 'huongbui337@example.com', '493631230347', '2024-05-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Dương', '0803242044', 'trangduong338@example.com', '820700159416', '2025-07-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Lê', '0823198189', 'ngale339@example.com', '847139155963', '2025-08-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Phan', '0912347649', 'nhatphan340@example.com', '078515867342', '2024-01-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Hồ', '0709003486', 'quangho341@example.com', '451837606441', '2025-08-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Bùi', '0927560417', 'lanbui342@example.com', '765612481569', '2025-01-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Đỗ', '0800272063', 'trangdo343@example.com', '459112382965', '2024-04-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Hoàng', '0729543165', 'quanghoang344@example.com', '266930089317', '2023-07-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Linh', 'Huỳnh', '0369694215', 'linhhuynh345@example.com', '291086771333', '2025-08-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Bùi', '0862639343', 'longbui346@example.com', '626204439735', '2024-08-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Lý', '0307256366', 'vyly347@example.com', '941180053759', '2025-08-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Trần', '0304896465', 'vantran348@example.com', '280924287572', '2023-04-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Hà', '0824150274', 'namha349@example.com', '564494856257', '2025-02-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Võ', '0803203207', 'huongvo350@example.com', '427617075877', '2024-05-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Hoàng', '0351342284', 'hanhhoang351@example.com', '993908926137', '2024-11-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Đỗ', '0341659152', 'hado352@example.com', '017774905097', '2023-11-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Yến', 'Lưu', '0930450189', 'yenluu353@example.com', '616423610326', '2025-03-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Bùi', '0914764925', 'nguyetbui354@example.com', '158377674996', '2023-04-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Hồ', '0526610857', 'nhatho355@example.com', '327881476174', '2023-06-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Bùi', '0986490810', 'habui356@example.com', '818661794549', '2023-03-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Sơn', 'Nguyễn', '0372260164', 'sonnguyen357@example.com', '597794523219', '2023-09-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Phạm', '0880061027', 'vypham358@example.com', '769749956412', '2023-05-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Phan', '0303037236', 'anhphan359@example.com', '831472760122', '2025-01-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Lý', '0870793349', 'vietly360@example.com', '605016679984', '2023-02-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Ngô', '0889973080', 'quynhngo361@example.com', '695814671795', '2024-04-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Dương', '0324375738', 'vietduong362@example.com', '395972466572', '2024-09-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khánh', 'Bùi', '0372232971', 'khanhbui363@example.com', '674338005452', '2023-06-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Sơn', 'Trần', '0356193183', 'sontran364@example.com', '745508428910', '2025-08-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Lý', '0319918081', 'phuongly365@example.com', '213524787125', '2023-12-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Phạm', '0976037548', 'hapham366@example.com', '214565328632', '2025-04-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Dương', '0878507208', 'nhatduong367@example.com', '115562606029', '2023-03-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Hà', '0766845504', 'tuha368@example.com', '892673899756', '2025-03-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Bùi', '0308562884', 'khanhbui369@example.com', '318848520089', '2023-09-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Bùi', '0881054851', 'lanbui370@example.com', '017490753998', '2025-05-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Vũ', '0744926831', 'tuanvu371@example.com', '589357126611', '2023-03-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Hoàng', '0837158698', 'nhathoang372@example.com', '864976776228', '2023-05-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Lý', '0988137702', 'quynhly373@example.com', '851961159408', '2023-06-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Hồ', '0754470229', 'hanhho374@example.com', '604432701851', '2025-06-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Dương', '0894975679', 'chiduong375@example.com', '228777251996', '2024-02-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Ngô', '0780741209', 'kienngo376@example.com', '481813989098', '2023-07-13');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Hà', '0318204339', 'quangha377@example.com', '718956907056', '2023-07-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Nguyễn', '0556411182', 'nhunguyen378@example.com', '422412462095', '2023-07-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Trần', '0761526546', 'baotran379@example.com', '103399378861', '2023-10-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Đỗ', '0886170630', 'dungdo380@example.com', '489138249671', '2025-05-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Hà', '0925823868', 'tuha381@example.com', '700794200749', '2023-09-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Ngô', '0739840289', 'vyngo382@example.com', '141612846398', '2025-09-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Đỗ', '0774355379', 'namdo383@example.com', '502097002687', '2025-02-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Võ', '0318071569', 'nguyetvo384@example.com', '562017537030', '2025-02-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Hồ', '0919433750', 'longho385@example.com', '479303614987', '2023-06-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Phan', '0599219212', 'trangphan386@example.com', '493843089487', '2023-01-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Trần', '0766418775', 'nhattran387@example.com', '803046875063', '2023-12-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hải', 'Lưu', '0336133254', 'hailuu388@example.com', '110760954317', '2023-09-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Trần', '0783199717', 'ngoctran389@example.com', '911006512070', '2023-11-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn Anh', 'Dương', '0310804661', 'tuananhduong390@example.com', '963990767699', '2023-04-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Nguyễn', '0885931109', 'ngocnguyen391@example.com', '193928456797', '2023-07-10');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Hoàng', '0302496854', 'lanhoang392@example.com', '982274954508', '2024-08-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Hoàng', '0338806533', 'vanhoang393@example.com', '315377959959', '2023-11-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Đỗ', '0917073033', 'nhudo394@example.com', '793375636205', '2023-01-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dương', 'Hồ', '0381247395', 'duongho395@example.com', '003342342583', '2023-07-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Nguyễn', '0941026153', 'khanhnguyen396@example.com', '473552896112', '2025-06-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Phan', '0986559630', 'haphan397@example.com', '993842530428', '2024-08-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Phan', '0379128685', 'quynhphan398@example.com', '787255877749', '2024-02-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tú', 'Lưu', '0333373634', 'tuluu399@example.com', '669254812147', '2024-06-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Vũ', '0507895677', 'nhatvu400@example.com', '665754602734', '2024-10-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dương', 'Hồ', '0348881431', 'duongho401@example.com', '115083535444', '2023-07-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Trần', '0984044566', 'vutran402@example.com', '907826333738', '2024-08-24');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trang', 'Lý', '0851536637', 'trangly403@example.com', '780529240755', '2023-08-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Dương', '0884590902', 'nhuduong404@example.com', '259999663618', '2024-01-31');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Trịnh', '0359741218', 'khanhtrinh405@example.com', '209702316433', '2023-10-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vân', 'Hà', '0370580256', 'vanha406@example.com', '621286716323', '2023-11-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Trịnh', '0999493874', 'nhattrinh407@example.com', '302716938597', '2024-04-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Lưu', '0314754692', 'phucluu408@example.com', '632967629160', '2023-09-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Đặng', '0541376815', 'huydang409@example.com', '118567243807', '2023-01-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dương', 'Lý', '0856360041', 'duongly410@example.com', '257771183727', '2025-04-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Huỳnh', '0909124186', 'longhuynh411@example.com', '210427523083', '2024-03-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Trần', '0516470900', 'viettran412@example.com', '633533106005', '2025-04-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khanh', 'Lê', '0912206815', 'khanhle413@example.com', '583938661331', '2024-01-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Huỳnh', '0365063731', 'namhuynh414@example.com', '495013649718', '2025-03-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Huỳnh', '0719562525', 'tramhuynh415@example.com', '715099768389', '2024-12-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Anh', 'Vũ', '0391436391', 'anhvu416@example.com', '025743263039', '2025-08-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Đỗ', '0945086403', 'phuongdo417@example.com', '553380339685', '2023-07-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phương', 'Nguyễn', '0371302321', 'phuongnguyen418@example.com', '298338167423', '2023-09-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Huỳnh', '0534497347', 'nhathuynh419@example.com', '156627768962', '2025-04-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Nguyễn', '0861498282', 'quangnguyen420@example.com', '467474689715', '2023-05-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vũ', 'Trịnh', '0923008576', 'vutrinh421@example.com', '665674916016', '2025-08-12');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Huỳnh', '0964587506', 'tramhuynh422@example.com', '633705024972', '2023-09-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Trần', '0520116691', 'lantran423@example.com', '836264488694', '2025-01-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Lê', '0395243640', 'nhule424@example.com', '270116864622', '2024-01-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huyền', 'Hoàng', '0972817932', 'huyenhoang425@example.com', '302346791214', '2023-03-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Phạm', '0715093771', 'ngocpham426@example.com', '004090138069', '2024-06-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Trịnh', '0859655553', 'longtrinh427@example.com', '566905510762', '2023-01-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Phạm', '0543579786', 'tuanpham428@example.com', '305050573976', '2025-01-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn Anh', 'Lê', '0767164932', 'tuananhle429@example.com', '898027148727', '2025-09-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Trịnh', '0533321160', 'hanhtrinh430@example.com', '256434712871', '2025-03-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Việt', 'Đỗ', '0999156686', 'vietdo431@example.com', '334141115931', '2024-08-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Hoàng', '0769040983', 'ngahoang432@example.com', '665528993160', '2024-07-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Đỗ', '0943772942', 'phucdo433@example.com', '095481497374', '2024-12-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Trần', '0723302764', 'ngoctran434@example.com', '208656756618', '2025-01-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Mai', 'Bùi', '0986125904', 'maibui435@example.com', '729277423330', '2024-01-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Yến', 'Lưu', '0326620157', 'yenluu436@example.com', '201859626301', '2023-09-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nguyệt', 'Trịnh', '0792617647', 'nguyettrinh437@example.com', '501111783099', '2024-08-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quang', 'Đặng', '0392676492', 'quangdang438@example.com', '151826068887', '2023-03-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Thảo', 'Lưu', '0513129208', 'thaoluu439@example.com', '751029321840', '2023-03-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Hà', '0758260340', 'hanhha440@example.com', '848729758598', '2024-06-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Khánh', 'Phạm', '0330324329', 'khanhpham441@example.com', '839542961844', '2024-01-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Huỳnh', '0871462831', 'tunghuynh442@example.com', '435989262566', '2023-01-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Vũ', '0341818615', 'tuanvu443@example.com', '155423401636', '2025-09-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Phạm', '0984971859', 'hapham444@example.com', '484910256258', '2024-07-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Ngô', '0892408222', 'tuanngo445@example.com', '694053967275', '2025-03-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Hà', '0746834146', 'phucha446@example.com', '511131290148', '2025-08-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Nguyễn', '0882778816', 'quynhnguyen447@example.com', '093068538909', '2024-04-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Hà', '0921528506', 'huyha448@example.com', '762515381447', '2023-10-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Linh', 'Phan', '0396348079', 'linhphan449@example.com', '705097545105', '2025-06-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Yến', 'Huỳnh', '0850167318', 'yenhuynh450@example.com', '826170243765', '2023-11-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Dương', '0984177225', 'ngaduong451@example.com', '605313402665', '2025-07-11');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Huỳnh', '0974167872', 'chihuynh452@example.com', '568621102258', '2023-01-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Vy', 'Vũ', '0356906744', 'vyvu453@example.com', '716392823414', '2024-12-18');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Dương', '0971892392', 'landuong454@example.com', '312604326093', '2023-04-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Ngô', '0884335670', 'dungngo455@example.com', '860414545635', '2025-07-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Huỳnh', '0300534749', 'dunghuynh456@example.com', '162475541108', '2025-02-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Đỗ', '0759895343', 'hado457@example.com', '961129109337', '2025-08-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Lê', '0595473820', 'hale458@example.com', '236848557161', '2024-05-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Như', 'Hà', '0502942409', 'nhuha459@example.com', '036788127868', '2025-03-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Ngô', '0543202939', 'ngocngo460@example.com', '087884434481', '2023-06-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Kiên', 'Trần', '0534024240', 'kientran461@example.com', '338105955184', '2025-01-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Dương', '0545005342', 'haduong462@example.com', '408916498373', '2023-11-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Long', 'Phan', '0562736527', 'longphan463@example.com', '172722397240', '2023-11-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Huỳnh', '0893121637', 'huyhuynh464@example.com', '618209166010', '2025-02-20');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Trần', '0931429001', 'tungtran465@example.com', '851327972457', '2023-06-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Lan', 'Trần', '0548100184', 'lantran466@example.com', '186203036625', '2024-11-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Mai', 'Vũ', '0817213145', 'maivu467@example.com', '195151092268', '2023-12-09');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Huỳnh', '0824945147', 'tuanhuynh468@example.com', '541022526771', '2023-04-26');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Trâm', 'Dương', '0721522655', 'tramduong469@example.com', '767695236687', '2024-07-05');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Trịnh', '0583619689', 'tientrinh470@example.com', '313503058721', '2023-03-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nhật', 'Hồ', '0947286333', 'nhatho471@example.com', '021260650191', '2024-05-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Huỳnh', '0325213109', 'tuanhuynh472@example.com', '622728476570', '2023-10-21');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Hoàng', '0309282066', 'hanhhoang473@example.com', '784984362418', '2024-01-22');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Phan', '0890362891', 'haphan474@example.com', '775662056341', '2023-04-17');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dương', 'Hồ', '0550342811', 'duongho475@example.com', '390438303419', '2024-08-01');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Chi', 'Lưu', '0800514054', 'chiluu476@example.com', '683565215681', '2024-05-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Nguyễn', '0567904227', 'huongnguyen477@example.com', '113322889857', '2025-03-15');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Đỗ', '0759606339', 'hado478@example.com', '912971024817', '2023-04-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Phúc', 'Đỗ', '0942149551', 'phucdo479@example.com', '127474721970', '2024-01-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Mai', 'Ngô', '0892758955', 'maingo480@example.com', '168740903802', '2025-05-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Bùi', '0829613671', 'habui481@example.com', '577871121663', '2024-02-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Ngọc', 'Lê', '0759737147', 'ngocle482@example.com', '082723590960', '2025-08-16');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nga', 'Dương', '0830306442', 'ngaduong483@example.com', '121461476834', '2023-07-08');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Dũng', 'Lê', '0854235677', 'dungle484@example.com', '826596089319', '2024-09-23');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hương', 'Đỗ', '0702727516', 'huongdo485@example.com', '480727910336', '2024-12-14');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Huỳnh', '0563533905', 'tienhuynh486@example.com', '504481776655', '2025-04-28');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tiến', 'Dương', '0551276528', 'tienduong487@example.com', '928664649111', '2023-04-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tùng', 'Nguyễn', '0561798178', 'tungnguyen488@example.com', '904633786137', '2025-08-31');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Hồ', '0866053844', 'hanhho489@example.com', '446306000258', '2025-04-19');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Tuấn', 'Đỗ', '0729638639', 'tuando490@example.com', '609626265826', '2023-08-25');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Hoàng', '0519648253', 'hahoang491@example.com', '110609209819', '2024-01-27');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Hoàng', '0852334383', 'baohoang492@example.com', '640412091179', '2023-05-06');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Hoàng', '0742117536', 'hahoang493@example.com', '170617136657', '2025-04-07');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Huy', 'Huỳnh', '0702990155', 'huyhuynh494@example.com', '799802841390', '2024-07-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Bảo', 'Hà', '0523513052', 'baoha495@example.com', '312447315847', '2025-02-02');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Quỳnh', 'Dương', '0563423461', 'quynhduong496@example.com', '994237676945', '2024-09-29');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hà', 'Trần', '0863955172', 'hatran497@example.com', '084964985601', '2023-07-04');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Nam', 'Dương', '0953135525', 'namduong498@example.com', '105053795381', '2024-01-30');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Mai', 'Trần', '0983184919', 'maitran499@example.com', '665533077046', '2023-05-03');
INSERT INTO KhachHang (TenKhachHang, HoKhachHang, SoDienThoai, Email, MaCccd, NgayTao) VALUES ('Hạnh', 'Lý', '0995963904', 'hanhly500@example.com', '090742608805', '2024-10-22');

-- Phong
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 235000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 235000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2181000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2181000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1371000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1371000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 484000.00, 'Đang đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 484000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1954000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1954000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1313000.00, 'Bảo trì', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1313000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2438000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2438000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 391000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 391000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 214000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 214000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 271000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 271000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1482000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1482000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1163000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1163000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1141000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1141000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1435000.00, 'Đã đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1435000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 552000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 552000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1504000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1504000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 224000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 224000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 335000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 335000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 788000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 788000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 541000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 541000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 264000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 264000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1171000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1171000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2004000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2004000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 467000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 467000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 889000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 889000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 929000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 929000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1162000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1162000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1328000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1328000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 648000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 648000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1743000.00, 'Đang đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1743000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 453000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 453000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 543000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 543000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1084000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1084000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 813000.00, 'Đã đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 813000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 926000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 926000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1325000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1325000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 916000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 916000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 624000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 624000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1626000.00, 'Đã đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1626000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 607000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 607000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 470000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 470000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1102000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1102000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1063000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1063000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2494000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2494000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 323000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 323000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1083000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1083000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2055000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2055000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 871000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 871000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 486000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 486000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 554000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 554000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1740000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1740000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1258000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1258000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 532000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 532000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1097000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1097000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1061000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1061000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1022000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1022000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 923000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 923000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1919000.00, 'Bảo trì', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1919000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 517000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 517000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 494000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 494000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 472000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 472000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1035000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1035000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1502000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1502000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1151000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1151000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1998000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1998000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 608000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 608000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1322000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1322000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 912000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 912000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1117000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1117000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2150000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2150000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1877000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1877000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1184000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1184000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1521000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1521000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 541000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 541000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 621000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 621000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1502000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1502000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 939000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 939000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1894000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1894000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 883000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 883000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 490000.00, 'Đang đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 490000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1455000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1455000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 571000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 571000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 251000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 251000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2274000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2274000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2336000.00, 'Bảo trì', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2336000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1279000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1279000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1069000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1069000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 908000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 908000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1193000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1193000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 895000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 895000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 984000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 984000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2453000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2453000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 765000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 765000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 991000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 991000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1436000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1436000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 299000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 299000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2008000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2008000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1498000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1498000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 860000.00, 'Bảo trì', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 860000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 579000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 579000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2328000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2328000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1906000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1906000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 916000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 916000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 932000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 932000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 525000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 525000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1860000.00, 'Bảo trì', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1860000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 895000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 895000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 455000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 455000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 877000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 877000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 696000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 696000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1566000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1566000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 666000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 666000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 432000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 432000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1445000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1445000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 450000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 450000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1421000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1421000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 225000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 225000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1499000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1499000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1081000.00, 'Bảo trì', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1081000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 558000.00, 'Bảo trì', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 558000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2008000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2008000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1705000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1705000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 348000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 348000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1426000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1426000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2482000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2482000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 333000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 333000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 718000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 718000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2090000.00, 'Đã đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2090000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 542000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 542000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 656000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 656000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 604000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 604000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 352000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 352000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2788000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2788000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2302000.00, 'Đã đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2302000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 896000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 896000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2121000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2121000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2364000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2364000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1655000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1655000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1644000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1644000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 427000.00, 'Bảo trì', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 427000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 881000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 881000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 709000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 709000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 924000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 924000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 956000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 956000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 654000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 654000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 957000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 957000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 436000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 436000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 871000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 871000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 228000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 228000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1338000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1338000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 348000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 348000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2257000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2257000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 579000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 579000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1157000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1157000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1739000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1739000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1158000.00, 'Bảo trì', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1158000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 628000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 628000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1533000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1533000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1336000.00, 'Bảo trì', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1336000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 448000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 448000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 517000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 517000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1018000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1018000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 499000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 499000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 442000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 442000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 854000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 854000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 353000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 353000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 640000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 640000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 666000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 666000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2698000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2698000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 526000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 526000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 988000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 988000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1885000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1885000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1720000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1720000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 896000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 896000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 904000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 904000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1000000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1000000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 437000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 437000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1003000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1003000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 946000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 946000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 497000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 497000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2720000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2720000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1585000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1585000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2777000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2777000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 766000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 766000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 615000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 615000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2499000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2499000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1071000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1071000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2289000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2289000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 685000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 685000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2140000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2140000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 530000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 530000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1940000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1940000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1125000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1125000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1961000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1961000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1202000.00, 'Bảo trì', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1202000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1198000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1198000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 838000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 838000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1551000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1551000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1335000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1335000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2851000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2851000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1190000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1190000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1869000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1869000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1145000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1145000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 831000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 831000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 717000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 717000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1198000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1198000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1221000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1221000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 289000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 289000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2741000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2741000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1718000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1718000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1596000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1596000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 606000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 606000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2366000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2366000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 488000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 488000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1294000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1294000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 405000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 405000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1863000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1863000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 374000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 374000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2932000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2932000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 984000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 984000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 760000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 760000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 541000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 541000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1575000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1575000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 491000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 491000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 705000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 705000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1172000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1172000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 738000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 738000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1544000.00, 'Đã đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1544000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2140000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2140000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 694000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 694000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 647000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 647000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 912000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 912000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 458000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 458000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 498000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 498000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1268000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1268000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1031000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1031000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1509000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1509000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 609000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 609000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2250000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2250000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1155000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1155000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 488000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 488000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1044000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1044000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 413000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 413000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 482000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 482000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 965000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 965000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 253000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 253000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 630000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 630000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1678000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1678000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 421000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 421000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 596000.00, 'Đang đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 596000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 947000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 947000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2096000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2096000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 482000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 482000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2268000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2268000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 840000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 840000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 541000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 541000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 515000.00, 'Bảo trì', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 515000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 960000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 960000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 818000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 818000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 501000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 501000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2230000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2230000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 981000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 981000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 568000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 568000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 239000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 239000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1069000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1069000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 958000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 958000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 699000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 699000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1680000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1680000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1214000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1214000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 610000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 610000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2362000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2362000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 854000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 854000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1398000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1398000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1900000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1900000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 926000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 926000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 506000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 506000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2144000.00, 'Bảo trì', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2144000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1272000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1272000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 933000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 933000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1763000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1763000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1481000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1481000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1115000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1115000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 933000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 933000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 338000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 338000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1315000.00, 'Đã đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1315000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 230000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 230000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 793000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 793000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1487000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1487000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 610000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 610000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2665000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2665000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2149000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2149000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1559000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1559000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1172000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1172000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1429000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1429000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1175000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1175000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2677000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2677000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1133000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1133000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 797000.00, 'Bảo trì', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 797000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2077000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2077000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 874000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 874000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1965000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1965000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1657000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1657000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 535000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 535000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1418000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1418000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 687000.00, 'Bảo trì', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 687000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 702000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 702000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 779000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 779000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 875000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 875000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 950000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 950000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1076000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1076000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1467000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1467000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 735000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 735000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 775000.00, 'Bảo trì', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 775000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2006000.00, 'Đã đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2006000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 818000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 818000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 341000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 341000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 721000.00, 'Bảo trì', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 721000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1068000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1068000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 865000.00, 'Đã đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 865000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 632000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 632000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1032000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1032000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 517000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 517000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1100000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1100000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1887000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1887000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1134000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1134000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1961000.00, 'Bảo trì', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1961000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 547000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 547000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1153000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1153000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 640000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 640000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 459000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 459000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 479000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 479000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1184000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1184000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2603000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2603000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2493000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2493000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 367000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 367000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 943000.00, 'Bảo trì', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 943000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2434000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2434000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1236000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1236000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 645000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 645000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1005000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1005000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 616000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 616000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1132000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1132000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 995000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 995000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 787000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 787000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 536000.00, 'Đang đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 536000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2261000.00, 'Bảo trì', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2261000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 239000.00, 'Bảo trì', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 239000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 978000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 978000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1045000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1045000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1803000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1803000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 452000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 452000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2706000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2706000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 989000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 989000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 736000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 736000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 836000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 836000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1372000.00, 'Đang đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1372000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2200000.00, 'Bảo trì', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2200000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1441000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1441000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 917000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 917000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1269000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1269000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 859000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 859000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 983000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 983000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 950000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 950000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2080000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2080000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1020000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1020000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 949000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 949000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 409000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 409000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 989000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 989000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 584000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 584000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 285000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 285000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1383000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1383000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2221000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2221000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 420000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 420000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 474000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 474000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 797000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 797000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 730000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 730000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 647000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 647000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 372000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 372000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1205000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1205000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 569000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 569000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2353000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2353000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1991000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1991000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1292000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1292000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1451000.00, 'Đang đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1451000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2986000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2986000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 503000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 503000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2757000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2757000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1061000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1061000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 686000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 686000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 318000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 318000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 649000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 649000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 993000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 993000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1284000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1284000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1375000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1375000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 442000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 442000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1762000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1762000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1188000.00, 'Đã đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1188000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 701000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 701000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 521000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 521000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1598000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1598000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 695000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 695000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1220000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1220000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1082000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1082000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 305000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 305000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1172000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1172000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 440000.00, 'Bảo trì', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 440000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 950000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 950000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 450000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 450000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 389000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 389000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 836000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 836000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 529000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 529000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1540000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1540000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1391000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1391000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1710000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1710000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 685000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 685000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 381000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 381000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1811000.00, 'Đang đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1811000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 760000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 760000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1064000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1064000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1088000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1088000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2189000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2189000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 421000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 421000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2200000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2200000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 1076000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 1076000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1045000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1045000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 932000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 932000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 785000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 785000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1089000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1089000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1010000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1010000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1151000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1151000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 603000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 603000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 464000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 464000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1777000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1777000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 451000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 451000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1127000.00, 'Trống', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1127000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2108000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2108000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1992000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1992000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2328000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2328000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1637000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1637000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 699000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 699000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2331000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2331000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 765000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 765000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 698000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 698000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1029000.00, 'Bảo trì', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1029000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 853000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 853000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 290000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 290000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1276000.00, 'Trống', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1276000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2530000.00, 'Đang đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2530000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2420000.00, 'Đã đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2420000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1930000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1930000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 429000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 429000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 620000.00, 'Đã đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 620000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 824000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 824000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 867000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 867000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1501000.00, 'Đã đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1501000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1516000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1516000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 337000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 337000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 747000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 747000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 357000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 357000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 986000.00, 'Đã đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 986000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 611000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 611000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 514000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 514000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1019000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1019000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 986000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 986000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 599000.00, 'Đang đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 599000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1385000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1385000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 535000.00, 'Trống', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 535000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 770000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 770000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 948000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 948000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1839000.00, 'Đang sử dụng', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1839000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 782000.00, 'Đang sử dụng', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 782000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 966000.00, 'Đang đặt', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 966000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 218000.00, 'Đã đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 218000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 504000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 504000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 786000.00, 'Trống', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 786000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 624000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 624000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1912000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1912000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1406000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1406000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2042000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2042000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2005000.00, 'Đã đặt', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2005000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 237000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 237000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 2601000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 2601000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Studio', 1521000.00, 'Trống', 'Phòng Studio với tiện nghi tiêu chuẩn, giá 1521000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 800000.00, 'Trống', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 800000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 719000.00, 'Đang đặt', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 719000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1749000.00, 'Đang đặt', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1749000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 880000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 880000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 335000.00, 'Bảo trì', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 335000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 882000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 882000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 890000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 890000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1848000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1848000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1529000.00, 'Đang đặt', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1529000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Superior', 650000.00, 'Đang sử dụng', 'Phòng Superior với tiện nghi tiêu chuẩn, giá 650000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 2190000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 2190000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Gia đình', 1381000.00, 'Đang sử dụng', 'Phòng Gia đình với tiện nghi tiêu chuẩn, giá 1381000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 431000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 431000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 403000.00, 'Đang đặt', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 403000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đặc biệt', 1457000.00, 'Đang sử dụng', 'Phòng Đặc biệt với tiện nghi tiêu chuẩn, giá 1457000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đơn', 529000.00, 'Đang sử dụng', 'Phòng Đơn với tiện nghi tiêu chuẩn, giá 529000 VND/ngày.');
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai, MoTa) VALUES ('Đôi', 1045000.00, 'Bảo trì', 'Phòng Đôi với tiện nghi tiêu chuẩn, giá 1045000 VND/ngày.');

-- HoaDon
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (49, 5740588.60, 'Hoàn tất', 'Chuyển khoản', '2024-08-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (128, 1113721.14, 'Hoàn tất', 'Chuyển khoản', '2024-06-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (371, 8444605.09, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (393, 5086152.09, 'Hoàn tất', 'Thẻ', '2023-12-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (428, 1760936.15, 'Hoàn tất', 'Thẻ', '2024-09-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (209, 8752850.79, 'Hoàn tất', 'Tiền mặt', '2025-02-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (288, 8008549.17, 'Hoàn tất', 'Chuyển khoản', '2025-09-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (334, 2586671.58, 'Hoàn tất', 'Chuyển khoản', '2024-06-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (285, 8628933.23, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (472, 1318925.60, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (66, 7641801.05, 'Hoàn tất', 'Thẻ', '2023-05-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (86, 2214465.83, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (20, 8889377.48, 'Hoàn tất', 'Thẻ', '2025-04-02');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (269, 5025775.76, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (215, 4174234.89, 'Hoàn tất', 'Chuyển khoản', '2023-10-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (369, 9243111.11, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (166, 6266474.73, 'Hoàn tất', 'Thẻ', '2023-06-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (73, 3114908.77, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (488, 7230405.56, 'Hoàn tất', 'Chuyển khoản', '2024-04-28');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (237, 2342986.18, 'Hoàn tất', 'Thẻ', '2025-01-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (437, 9300064.00, 'Hoàn tất', 'Thẻ', '2025-04-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (243, 395265.51, 'Hoàn tất', 'Tiền mặt', '2024-04-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (35, 9935110.08, 'Hoàn tất', 'Thẻ', '2023-07-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (103, 7032238.17, 'Hoàn tất', 'Chuyển khoản', '2023-04-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (32, 6362235.81, 'Hoàn tất', 'Tiền mặt', '2023-12-25');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (326, 5723814.06, 'Hoàn tất', 'Thẻ', '2023-01-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (476, 2168614.44, 'Hoàn tất', 'Chuyển khoản', '2024-08-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (374, 3265778.11, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (479, 2771069.03, 'Hoàn tất', 'Thẻ', '2023-07-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (40, 6048599.53, 'Hoàn tất', 'Tiền mặt', '2023-10-14');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (92, 2850494.89, 'Hoàn tất', 'Thẻ', '2024-08-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (331, 7730727.12, 'Hoàn tất', 'Thẻ', '2024-09-11');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (142, 9676591.22, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (343, 9119528.52, 'Hoàn tất', 'Tiền mặt', '2025-03-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (119, 9894146.09, 'Hoàn tất', 'Thẻ', '2023-05-31');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (74, 1898738.36, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (40, 8990747.42, 'Hoàn tất', 'Thẻ', '2025-04-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (226, 4426435.66, 'Hoàn tất', 'Chuyển khoản', '2024-05-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (390, 1437776.01, 'Hoàn tất', 'Chuyển khoản', '2025-03-03');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (198, 7150572.54, 'Hoàn tất', 'Thẻ', '2023-11-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (272, 1058536.72, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (490, 1911328.22, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (365, 1685974.80, 'Hoàn tất', 'Chuyển khoản', '2024-05-16');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (356, 7952961.04, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (461, 4523509.72, 'Hoàn tất', 'Tiền mặt', '2025-06-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (188, 8597111.44, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (373, 4413555.92, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (196, 3929796.83, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (101, 4588181.50, 'Hoàn tất', 'Tiền mặt', '2024-08-23');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (159, 3485979.98, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (258, 9239170.35, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (332, 2967028.76, 'Hoàn tất', 'Tiền mặt', '2024-12-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (361, 2754468.15, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (422, 595136.99, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (312, 6432728.80, 'Hoàn tất', 'Chuyển khoản', '2025-02-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (448, 6581220.40, 'Hoàn tất', 'Tiền mặt', '2023-02-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (190, 579718.61, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (362, 7441102.84, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (43, 4369854.06, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (228, 6483538.11, 'Hoàn tất', 'Tiền mặt', '2025-05-28');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (279, 2991538.21, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (315, 7453300.23, 'Hoàn tất', 'Thẻ', '2025-05-18');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (461, 3369858.77, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (370, 9459719.45, 'Hoàn tất', 'Thẻ', '2024-02-17');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (214, 8425851.74, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (99, 8302961.17, 'Hoàn tất', 'Thẻ', '2023-10-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (43, 1974076.73, 'Hoàn tất', 'Thẻ', '2023-07-23');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (353, 5203018.56, 'Hoàn tất', 'Thẻ', '2025-05-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (429, 9428572.38, 'Hoàn tất', 'Thẻ', '2023-12-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (61, 3612089.16, 'Hoàn tất', 'Thẻ', '2023-03-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (290, 9323646.65, 'Hoàn tất', 'Tiền mặt', '2023-07-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (374, 1138251.24, 'Hoàn tất', 'Thẻ', '2023-01-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (393, 1942557.65, 'Hoàn tất', 'Thẻ', '2024-01-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (236, 1088366.85, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (158, 8421890.73, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (383, 7631575.67, 'Hoàn tất', 'Tiền mặt', '2024-01-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (362, 3084642.60, 'Hoàn tất', 'Thẻ', '2023-11-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (212, 2491815.69, 'Hoàn tất', 'Tiền mặt', '2023-07-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (152, 2815734.67, 'Hoàn tất', 'Tiền mặt', '2024-05-16');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (182, 5913352.79, 'Hoàn tất', 'Thẻ', '2024-06-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (231, 8346150.74, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (19, 9511751.74, 'Hoàn tất', 'Tiền mặt', '2024-07-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (292, 2343429.13, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (331, 8165810.73, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (176, 7086642.12, 'Hoàn tất', 'Thẻ', '2025-03-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (138, 1180347.75, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (112, 4836575.51, 'Hoàn tất', 'Tiền mặt', '2024-06-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (338, 6421802.55, 'Hoàn tất', 'Chuyển khoản', '2024-08-23');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (166, 3911142.65, 'Hoàn tất', 'Thẻ', '2025-07-11');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (18, 3427008.85, 'Hoàn tất', 'Chuyển khoản', '2025-06-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (462, 376613.53, 'Hoàn tất', 'Chuyển khoản', '2023-12-11');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (332, 9058904.78, 'Hoàn tất', 'Chuyển khoản', '2023-11-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (84, 4828359.95, 'Hoàn tất', 'Tiền mặt', '2024-03-25');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (415, 6281139.56, 'Hoàn tất', 'Thẻ', '2024-03-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (375, 4173534.76, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (371, 3920183.35, 'Hoàn tất', 'Thẻ', '2024-02-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (154, 689250.99, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (391, 9367118.12, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (216, 4431174.02, 'Hoàn tất', 'Thẻ', '2024-02-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (304, 576985.16, 'Hoàn tất', 'Chuyển khoản', '2025-06-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (306, 9662785.43, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (488, 9732549.20, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (340, 3531527.01, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (159, 7990775.38, 'Hoàn tất', 'Chuyển khoản', '2024-04-14');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (203, 1903818.19, 'Hoàn tất', 'Tiền mặt', '2023-07-25');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (453, 1969063.81, 'Hoàn tất', 'Tiền mặt', '2023-08-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (440, 2272223.22, 'Hoàn tất', 'Tiền mặt', '2023-06-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (351, 5686877.84, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (245, 1845499.10, 'Hoàn tất', 'Thẻ', '2024-12-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (202, 7078163.56, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (193, 8364065.82, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (199, 1546473.22, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (205, 7800626.26, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (374, 8765032.83, 'Hoàn tất', 'Thẻ', '2023-03-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (178, 5036600.49, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (14, 2450432.23, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (189, 3814120.25, 'Hoàn tất', 'Tiền mặt', '2024-09-17');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (307, 7591339.26, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (118, 1639375.03, 'Hoàn tất', 'Tiền mặt', '2023-11-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (223, 1200648.42, 'Hoàn tất', 'Tiền mặt', '2024-03-11');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (78, 3064152.00, 'Hoàn tất', 'Chuyển khoản', '2023-02-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (134, 9597573.63, 'Hoàn tất', 'Tiền mặt', '2024-02-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (350, 5318281.14, 'Hoàn tất', 'Tiền mặt', '2023-12-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (352, 7406905.38, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (412, 8127081.50, 'Hoàn tất', 'Tiền mặt', '2024-08-11');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (260, 4024705.77, 'Hoàn tất', 'Chuyển khoản', '2024-10-31');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (492, 6800890.79, 'Hoàn tất', 'Tiền mặt', '2023-11-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (218, 2808895.78, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (414, 8083458.43, 'Hoàn tất', 'Chuyển khoản', '2025-03-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (243, 7206627.72, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (58, 7919298.82, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (389, 4019676.69, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (4, 3570022.19, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (133, 2216846.58, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (447, 4713396.81, 'Hoàn tất', 'Chuyển khoản', '2023-02-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (63, 8718598.15, 'Hoàn tất', 'Tiền mặt', '2025-06-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (307, 6957960.09, 'Hoàn tất', 'Chuyển khoản', '2024-11-22');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (152, 7738287.39, 'Hoàn tất', 'Chuyển khoản', '2023-07-03');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (151, 3761788.01, 'Hoàn tất', 'Chuyển khoản', '2023-11-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (326, 645466.24, 'Hoàn tất', 'Thẻ', '2023-02-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (273, 7465198.97, 'Hoàn tất', 'Tiền mặt', '2024-07-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (49, 1522729.89, 'Hoàn tất', 'Chuyển khoản', '2024-03-17');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (458, 2964553.46, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (317, 2667776.83, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (421, 5378519.85, 'Hoàn tất', 'Tiền mặt', '2023-12-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (191, 671387.59, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (327, 8181021.83, 'Hoàn tất', 'Thẻ', '2025-01-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (41, 3576395.59, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (217, 4187174.00, 'Hoàn tất', 'Thẻ', '2023-09-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (370, 6633085.71, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (495, 1429326.68, 'Hoàn tất', 'Chuyển khoản', '2023-11-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (316, 5286183.85, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (356, 8049854.77, 'Hoàn tất', 'Chuyển khoản', '2023-08-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (390, 9374139.18, 'Hoàn tất', 'Thẻ', '2025-03-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (96, 2985481.97, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (205, 9124540.18, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (3, 4249673.08, 'Hoàn tất', 'Chuyển khoản', '2024-11-03');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (67, 2965256.00, 'Hoàn tất', 'Thẻ', '2023-11-22');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (50, 2446839.75, 'Hoàn tất', 'Chuyển khoản', '2023-08-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (33, 6230446.91, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (424, 4768248.28, 'Hoàn tất', 'Thẻ', '2023-12-03');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (278, 4073683.27, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (176, 3603780.99, 'Hoàn tất', 'Chuyển khoản', '2023-06-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (237, 8587253.09, 'Hoàn tất', 'Thẻ', '2024-12-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (88, 6827963.73, 'Hoàn tất', 'Tiền mặt', '2024-11-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (437, 5841738.93, 'Hoàn tất', 'Chuyển khoản', '2024-07-28');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (177, 1105992.38, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (190, 3249117.48, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (346, 4833587.03, 'Hoàn tất', 'Thẻ', '2023-06-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (320, 3710775.87, 'Hoàn tất', 'Tiền mặt', '2025-02-08');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (499, 3053710.51, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (193, 9235409.93, 'Hoàn tất', 'Thẻ', '2025-08-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (436, 1497891.87, 'Hoàn tất', 'Tiền mặt', '2023-04-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (293, 3106685.07, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (206, 5635682.45, 'Hoàn tất', 'Tiền mặt', '2024-03-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (462, 6112710.82, 'Hoàn tất', 'Chuyển khoản', '2024-10-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (55, 6743075.40, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (391, 6471260.82, 'Hoàn tất', 'Thẻ', '2024-02-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (116, 8632848.90, 'Hoàn tất', 'Chuyển khoản', '2023-10-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (423, 9268138.18, 'Hoàn tất', 'Tiền mặt', '2024-02-14');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (148, 332372.58, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (336, 1971025.48, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (298, 6635111.14, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (97, 6473243.69, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (313, 6313226.86, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (293, 7401835.55, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (313, 2724425.32, 'Hoàn tất', 'Chuyển khoản', '2024-12-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (47, 9532906.98, 'Hoàn tất', 'Thẻ', '2025-06-23');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (405, 6644925.64, 'Hoàn tất', 'Tiền mặt', '2025-05-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (468, 1865378.95, 'Hoàn tất', 'Tiền mặt', '2023-06-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (242, 9390266.61, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (68, 3141924.58, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (296, 4773442.00, 'Hoàn tất', 'Thẻ', '2024-03-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (124, 8028509.50, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (329, 1378225.78, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (447, 9225511.41, 'Hoàn tất', 'Chuyển khoản', '2025-01-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (493, 977470.03, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (347, 4241563.06, 'Hoàn tất', 'Chuyển khoản', '2025-06-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (198, 982546.45, 'Hoàn tất', 'Chuyển khoản', '2025-06-23');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (367, 5512212.03, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (332, 9895325.50, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (247, 8329212.17, 'Hoàn tất', 'Chuyển khoản', '2025-04-28');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (422, 7333960.23, 'Hoàn tất', 'Chuyển khoản', '2025-01-03');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (475, 5262129.09, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (404, 1503351.41, 'Hoàn tất', 'Chuyển khoản', '2025-02-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (423, 5924176.22, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (87, 3854705.71, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (468, 2657766.11, 'Hoàn tất', 'Chuyển khoản', '2023-04-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (169, 6527745.04, 'Hoàn tất', 'Thẻ', '2024-05-18');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (386, 2673865.91, 'Hoàn tất', 'Chuyển khoản', '2024-12-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (228, 3507413.77, 'Hoàn tất', 'Chuyển khoản', '2024-08-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (141, 6065952.86, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (268, 3097775.17, 'Hoàn tất', 'Chuyển khoản', '2024-07-31');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (186, 7223890.36, 'Hoàn tất', 'Thẻ', '2023-06-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (291, 6448777.42, 'Hoàn tất', 'Chuyển khoản', '2024-11-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (151, 1798080.49, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (76, 6192259.39, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (327, 2510804.88, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (156, 1739124.63, 'Hoàn tất', 'Chuyển khoản', '2025-01-08');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (261, 7530935.21, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (245, 6299061.92, 'Hoàn tất', 'Chuyển khoản', '2024-10-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (80, 5995213.63, 'Hoàn tất', 'Thẻ', '2024-01-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (194, 8694464.28, 'Hoàn tất', 'Tiền mặt', '2025-06-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (269, 4975909.09, 'Hoàn tất', 'Chuyển khoản', '2023-01-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (343, 9485398.06, 'Hoàn tất', 'Chuyển khoản', '2023-07-31');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (115, 1755858.65, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (405, 1460036.77, 'Hoàn tất', 'Chuyển khoản', '2024-04-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (292, 9153214.30, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (434, 8243295.91, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (380, 2264540.85, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (321, 1258748.20, 'Hoàn tất', 'Tiền mặt', '2023-10-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (284, 9628064.94, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (447, 1070638.73, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (291, 5372603.32, 'Hoàn tất', 'Thẻ', '2023-07-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (354, 9382434.35, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (354, 7258589.16, 'Hoàn tất', 'Thẻ', '2023-09-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (283, 2991522.61, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (426, 9199428.30, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (268, 3236780.29, 'Hoàn tất', 'Tiền mặt', '2024-08-22');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (390, 5938323.24, 'Hoàn tất', 'Thẻ', '2025-06-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (401, 795503.16, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (101, 4939500.74, 'Hoàn tất', 'Chuyển khoản', '2023-07-22');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (52, 5560977.69, 'Hoàn tất', 'Chuyển khoản', '2023-11-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (292, 393144.02, 'Hoàn tất', 'Tiền mặt', '2025-01-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (454, 4593625.61, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (413, 6458845.76, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (129, 7619234.43, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (324, 2012359.20, 'Hoàn tất', 'Thẻ', '2023-10-18');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (488, 6559212.51, 'Hoàn tất', 'Thẻ', '2023-09-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (175, 2970296.98, 'Hoàn tất', 'Chuyển khoản', '2024-10-02');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (226, 1381259.57, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (250, 363217.67, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (241, 5109142.89, 'Hoàn tất', 'Chuyển khoản', '2024-11-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (156, 1217309.37, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (327, 6963501.60, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (399, 1354503.52, 'Hoàn tất', 'Chuyển khoản', '2024-05-28');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (157, 3404153.85, 'Hoàn tất', 'Tiền mặt', '2024-12-02');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (154, 9297249.53, 'Hoàn tất', 'Thẻ', '2023-06-08');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (166, 1816960.94, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (437, 1832048.69, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (490, 5309723.08, 'Hoàn tất', 'Thẻ', '2025-03-18');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (214, 7863622.65, 'Hoàn tất', 'Chuyển khoản', '2024-04-28');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (479, 8605504.11, 'Hoàn tất', 'Tiền mặt', '2023-11-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (171, 7349083.48, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (231, 3287763.78, 'Hoàn tất', 'Chuyển khoản', '2023-01-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (391, 9417876.86, 'Hoàn tất', 'Chuyển khoản', '2023-12-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (331, 8112096.34, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (10, 8239770.76, 'Hoàn tất', 'Thẻ', '2025-01-03');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (132, 3159529.84, 'Hoàn tất', 'Chuyển khoản', '2024-03-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (405, 4009341.44, 'Hoàn tất', 'Thẻ', '2023-07-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (409, 2385304.59, 'Hoàn tất', 'Chuyển khoản', '2023-04-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (39, 2658436.81, 'Hoàn tất', 'Chuyển khoản', '2025-08-22');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (370, 6051520.59, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (400, 6696356.89, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (250, 2723507.41, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (193, 875373.17, 'Hoàn tất', 'Chuyển khoản', '2023-10-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (276, 3883653.64, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (242, 1602561.92, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (397, 7404755.50, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (302, 3198899.60, 'Hoàn tất', 'Tiền mặt', '2024-03-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (126, 3480068.50, 'Hoàn tất', 'Thẻ', '2023-09-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (286, 5450966.55, 'Hoàn tất', 'Tiền mặt', '2023-05-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (396, 7768087.04, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (365, 7468864.96, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (464, 7795218.98, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (95, 3416291.18, 'Hoàn tất', 'Chuyển khoản', '2023-12-08');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (102, 6873387.38, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (310, 7552207.72, 'Hoàn tất', 'Tiền mặt', '2024-10-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (211, 4445110.01, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (426, 5425454.60, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (192, 457152.31, 'Hoàn tất', 'Tiền mặt', '2025-09-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (259, 8768884.59, 'Hoàn tất', 'Thẻ', '2024-05-18');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (145, 5875710.05, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (39, 5783476.02, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (273, 1834772.01, 'Hoàn tất', 'Tiền mặt', '2024-08-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (473, 4843933.92, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (385, 1008910.56, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (239, 4677499.30, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (78, 6609303.87, 'Hoàn tất', 'Thẻ', '2024-08-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (174, 4704256.68, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (420, 9500485.80, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (295, 3149993.74, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (10, 382817.68, 'Hoàn tất', 'Tiền mặt', '2023-09-23');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (439, 2462032.87, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (273, 4740207.21, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (474, 3740059.52, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (79, 2131819.55, 'Hoàn tất', 'Chuyển khoản', '2023-07-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (52, 554377.56, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (400, 1535038.36, 'Hoàn tất', 'Tiền mặt', '2023-12-02');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (446, 3358761.62, 'Hoàn tất', 'Tiền mặt', '2023-07-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (156, 1883902.42, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (480, 9222819.13, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (71, 8813084.66, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (428, 9495732.85, 'Hoàn tất', 'Thẻ', '2025-05-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (379, 2323268.18, 'Hoàn tất', 'Chuyển khoản', '2024-02-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (102, 2294633.00, 'Hoàn tất', 'Tiền mặt', '2023-04-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (497, 1998438.80, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (265, 1480526.40, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (482, 5044351.74, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (163, 4326740.31, 'Hoàn tất', 'Tiền mặt', '2025-03-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (260, 3790627.25, 'Hoàn tất', 'Tiền mặt', '2025-08-25');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (234, 456610.97, 'Hoàn tất', 'Chuyển khoản', '2024-02-14');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (493, 8617682.81, 'Hoàn tất', 'Chuyển khoản', '2025-05-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (34, 4511244.18, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (118, 9997153.67, 'Hoàn tất', 'Thẻ', '2025-04-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (200, 8796635.62, 'Hoàn tất', 'Chuyển khoản', '2025-01-17');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (332, 9004112.60, 'Hoàn tất', 'Tiền mặt', '2023-07-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (290, 389957.29, 'Hoàn tất', 'Tiền mặt', '2024-12-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (241, 7694192.05, 'Hoàn tất', 'Tiền mặt', '2025-06-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (379, 6711236.25, 'Hoàn tất', 'Chuyển khoản', '2025-04-23');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (81, 4366619.75, 'Hoàn tất', 'Thẻ', '2023-06-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (380, 8151350.61, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (451, 9272058.55, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (255, 2279545.89, 'Hoàn tất', 'Chuyển khoản', '2025-07-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (431, 2872259.05, 'Hoàn tất', 'Tiền mặt', '2023-12-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (15, 8921558.37, 'Hoàn tất', 'Tiền mặt', '2025-07-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (209, 751044.67, 'Hoàn tất', 'Thẻ', '2025-01-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (269, 1946480.24, 'Hoàn tất', 'Chuyển khoản', '2025-07-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (115, 1193601.82, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (496, 4914186.89, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (226, 1603732.34, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (1, 3320879.56, 'Hoàn tất', 'Chuyển khoản', '2023-05-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (166, 6666830.44, 'Hoàn tất', 'Thẻ', '2024-11-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (367, 1235063.41, 'Hoàn tất', 'Thẻ', '2023-07-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (65, 2427317.96, 'Hoàn tất', 'Tiền mặt', '2023-08-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (338, 1097233.15, 'Hoàn tất', 'Chuyển khoản', '2023-10-17');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (455, 6265641.17, 'Hoàn tất', 'Chuyển khoản', '2023-07-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (374, 6695882.78, 'Hoàn tất', 'Chuyển khoản', '2024-11-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (303, 5343194.18, 'Hoàn tất', 'Chuyển khoản', '2025-02-17');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (461, 1577558.84, 'Hoàn tất', 'Thẻ', '2023-05-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (297, 7443180.17, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (464, 8057782.45, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (94, 438920.79, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (83, 4148606.88, 'Hoàn tất', 'Chuyển khoản', '2024-05-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (440, 3635847.17, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (208, 4685409.91, 'Hoàn tất', 'Thẻ', '2023-09-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (280, 4566671.07, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (394, 5290561.82, 'Hoàn tất', 'Tiền mặt', '2023-09-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (175, 8127788.44, 'Hoàn tất', 'Thẻ', '2024-04-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (340, 1236083.09, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (135, 912242.38, 'Hoàn tất', 'Thẻ', '2023-01-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (494, 5570192.23, 'Hoàn tất', 'Chuyển khoản', '2025-04-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (57, 1466694.12, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (448, 3671955.17, 'Hoàn tất', 'Thẻ', '2025-08-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (43, 9673037.75, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (204, 8254258.22, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (100, 1674571.72, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (102, 7414099.54, 'Hoàn tất', 'Thẻ', '2025-03-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (78, 5759965.13, 'Hoàn tất', 'Tiền mặt', '2025-03-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (273, 3817764.66, 'Hoàn tất', 'Thẻ', '2023-06-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (192, 1839873.03, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (325, 8631725.90, 'Hoàn tất', 'Thẻ', '2023-06-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (277, 9439262.28, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (143, 774448.17, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (152, 4080792.28, 'Hoàn tất', 'Chuyển khoản', '2025-07-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (244, 4839640.23, 'Hoàn tất', 'Chuyển khoản', '2023-01-01');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (39, 2737893.64, 'Hoàn tất', 'Chuyển khoản', '2023-08-02');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (473, 7414566.76, 'Hoàn tất', 'Tiền mặt', '2023-03-02');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (387, 4280642.63, 'Hoàn tất', 'Tiền mặt', '2025-02-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (498, 8127786.28, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (201, 7927234.64, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (303, 2175701.59, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (116, 9644566.24, 'Hoàn tất', 'Chuyển khoản', '2023-05-07');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (372, 7474653.35, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (106, 4600799.15, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (6, 6476539.09, 'Hoàn tất', 'Thẻ', '2023-04-16');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (396, 6396893.64, 'Hoàn tất', 'Thẻ', '2024-03-24');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (153, 8275731.57, 'Hoàn tất', 'Thẻ', '2024-04-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (79, 982906.51, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (175, 8789784.13, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (196, 8428381.22, 'Hoàn tất', 'Thẻ', '2024-04-22');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (219, 5974292.17, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (444, 8006219.45, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (268, 1299586.61, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (492, 6110755.72, 'Hoàn tất', 'Thẻ', '2024-05-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (429, 7105510.75, 'Hoàn tất', 'Tiền mặt', '2024-10-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (54, 8692122.26, 'Hoàn tất', 'Thẻ', '2025-01-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (142, 9075894.17, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (215, 6769691.30, 'Hoàn tất', 'Chuyển khoản', '2023-03-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (7, 1280970.53, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (300, 5101268.00, 'Hoàn tất', 'Thẻ', '2023-09-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (54, 9973834.62, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (288, 6184414.02, 'Hoàn tất', 'Thẻ', '2024-06-15');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (446, 9274857.99, 'Hoàn tất', 'Thẻ', '2023-04-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (303, 8430594.79, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (295, 1220661.59, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (185, 5927183.97, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (216, 8208250.34, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (178, 6576758.20, 'Hoàn tất', 'Chuyển khoản', '2024-08-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (443, 5370824.29, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (382, 7843018.49, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (111, 5799220.97, 'Hoàn tất', 'Chuyển khoản', '2023-04-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (150, 9230496.02, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (234, 8539471.81, 'Hoàn tất', 'Thẻ', '2023-12-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (181, 9743721.76, 'Hoàn tất', 'Chuyển khoản', '2025-03-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (25, 3447770.31, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (135, 7755528.05, 'Hoàn tất', 'Thẻ', '2025-02-28');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (443, 5608593.85, 'Hoàn tất', 'Chuyển khoản', '2025-02-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (179, 7875391.78, 'Hoàn tất', 'Chuyển khoản', '2025-05-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (46, 3537503.69, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (413, 8411485.80, 'Hoàn tất', 'Chuyển khoản', '2023-04-14');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (469, 7302824.47, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (319, 5122769.12, 'Hoàn tất', 'Chuyển khoản', '2023-07-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (136, 8602967.18, 'Hoàn tất', 'Chuyển khoản', '2025-04-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (225, 8989068.24, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (166, 454495.11, 'Hoàn tất', 'Chuyển khoản', '2025-07-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (260, 7092214.52, 'Hoàn tất', 'Thẻ', '2024-07-05');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (92, 4160320.95, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (48, 1178259.51, 'Hoàn tất', 'Thẻ', '2024-02-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (437, 2854689.44, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (182, 4148540.37, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (433, 9573927.10, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (315, 5830035.78, 'Hoàn tất', 'Tiền mặt', '2024-03-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (423, 695496.57, 'Hoàn tất', 'Thẻ', '2023-10-08');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (14, 5096581.40, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (126, 8788818.74, 'Hoàn tất', 'Tiền mặt', '2023-05-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (7, 3178893.41, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (248, 8427927.98, 'Hoàn tất', 'Thẻ', '2024-08-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (99, 4299538.59, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (205, 6384374.56, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (383, 2836475.12, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (412, 8076735.63, 'Hoàn tất', 'Chuyển khoản', '2025-07-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (474, 9388145.07, 'Hoàn tất', 'Chuyển khoản', '2023-03-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (491, 7024030.90, 'Hoàn tất', 'Thẻ', '2023-09-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (408, 5521271.62, 'Hoàn tất', 'Thẻ', '2024-12-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (244, 5492991.17, 'Hoàn tất', 'Thẻ', '2023-08-22');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (369, 3678925.05, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (421, 9855247.72, 'Hoàn tất', 'Thẻ', '2025-05-06');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (28, 4764317.05, 'Hoàn tất', 'Thẻ', '2024-03-22');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (34, 9545690.91, 'Hoàn tất', 'Thẻ', '2024-04-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (287, 6607692.43, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (445, 7151197.44, 'Hoàn tất', 'Chuyển khoản', '2023-03-08');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (489, 7273027.30, 'Hoàn tất', 'Thẻ', '2023-01-29');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (366, 6098063.60, 'Hoàn tất', 'Tiền mặt', '2024-02-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (111, 6719468.03, 'Hoàn tất', 'Thẻ', '2024-11-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (156, 3506172.48, 'Hoàn tất', 'Thẻ', '2025-08-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (209, 1699060.77, 'Hoàn tất', 'Thẻ', '2024-08-23');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (162, 8668520.50, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (365, 7618323.31, 'Hoàn tất', 'Tiền mặt', '2024-09-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (33, 5438788.20, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (100, 2713355.47, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (428, 2058009.50, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (374, 1459150.93, 'Hoàn tất', 'Chuyển khoản', '2024-08-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (359, 9505589.94, 'Hoàn tất', 'Chuyển khoản', '2024-01-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (357, 4901753.35, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (50, 3318595.22, 'Hoàn tất', 'Chuyển khoản', '2025-06-19');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (130, 5146913.69, 'Hoàn tất', 'Chuyển khoản', '2023-07-25');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (117, 3706646.64, 'Đang xử lý', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (174, 4681756.68, 'Hoàn tất', 'Chuyển khoản', '2023-01-21');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (451, 6179746.44, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (350, 3919525.72, 'Hoàn tất', 'Thẻ', '2023-01-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (3, 3470538.73, 'Hoàn tất', 'Thẻ', '2024-07-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (192, 8635778.65, 'Hủy', 'Tiền mặt', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (326, 6322462.25, 'Hoàn tất', 'Tiền mặt', '2023-12-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (50, 8759341.82, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (192, 5867654.61, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (434, 8832817.86, 'Hoàn tất', 'Tiền mặt', '2025-04-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (420, 4617532.54, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (455, 9592904.29, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (479, 3126880.15, 'Hoàn tất', 'Tiền mặt', '2024-08-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (266, 1923637.50, 'Hoàn tất', 'Tiền mặt', '2024-09-09');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (80, 9974216.48, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (476, 6687333.62, 'Đang xử lý', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (484, 1428901.79, 'Hoàn tất', 'Chuyển khoản', '2023-09-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (188, 1671399.36, 'Hủy', 'Chuyển khoản', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (97, 8002323.41, 'Hoàn tất', 'Tiền mặt', '2025-07-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (472, 4960106.95, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (363, 7619731.82, 'Hoàn tất', 'Thẻ', '2023-04-04');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (340, 6651600.11, 'Hủy', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (295, 7111397.31, 'Hoàn tất', 'Thẻ', '2024-10-20');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (103, 3040847.11, 'Hoàn tất', 'Tiền mặt', '2023-10-27');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (484, 6375490.97, 'Hoàn tất', 'Chuyển khoản', '2023-03-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (252, 531191.26, 'Hoàn tất', 'Thẻ', '2024-05-10');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (313, 4071443.95, 'Hoàn tất', 'Chuyển khoản', '2025-02-28');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (351, 7079346.04, 'Hoàn tất', 'Tiền mặt', '2023-07-12');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (485, 1165118.73, 'Đang xử lý', 'Thẻ', NULL);
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (461, 5841366.63, 'Hoàn tất', 'Chuyển khoản', '2025-01-26');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (25, 5482633.68, 'Hoàn tất', 'Chuyển khoản', '2024-01-30');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (97, 3712126.42, 'Hoàn tất', 'Thẻ', '2025-06-13');
INSERT INTO HoaDon (MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan) VALUES (223, 7463838.84, 'Hoàn tất', 'Tiền mặt', '2024-06-04');

-- DatPhong
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (190, 349, '2024-12-16', '2024-12-17', 455331.05, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (457, 114, '2024-12-30', '2025-01-05', 328, 36481.74, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (314, 8, '2023-02-16', '2023-02-23', 103014.92, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (3, 464, '2023-09-04', '2023-09-15', 406818.87, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (200, 424, '2023-08-22', '2023-08-28', 307, 458791.85, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (127, 319, '2024-11-15', '2024-11-20', 443, 440972.39, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (462, 321, '2023-11-14', '2023-11-18', 470136.40, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (210, 354, '2023-01-11', '2023-01-18', 411777.46, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (98, 419, '2025-03-08', '2025-03-16', 126712.74, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (22, 357, '2025-02-24', '2025-03-04', 59, 64444.12, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (60, 82, '2025-07-12', '2025-07-25', 484, 244268.40, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (379, 132, '2025-09-05', '2025-09-16', 147, 357511.69, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (146, 439, '2024-08-06', '2024-08-11', 54246.03, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (453, 104, '2025-08-31', '2025-09-02', 19, 277374.99, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (241, 246, '2023-04-22', '2023-04-24', 391, 114322.54, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (356, 413, '2023-03-11', '2023-03-15', 217974.31, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (227, 306, '2025-02-26', '2025-02-27', 331438.38, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (394, 108, '2025-01-12', '2025-01-18', 441, 21878.95, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (487, 129, '2025-08-01', '2025-08-04', 175058.61, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (201, 195, '2023-06-06', '2023-06-11', 252797.30, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (172, 337, '2025-01-08', '2025-01-16', 12654.84, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (309, 271, '2023-10-22', '2023-10-31', 58, 80549.00, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (351, 34, '2024-02-24', '2024-03-04', 478, 267136.88, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (165, 190, '2023-02-09', '2023-02-12', 2, 450759.81, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (289, 30, '2025-04-13', '2025-04-20', 322, 384347.72, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (19, 289, '2024-07-12', '2024-07-14', 293, 9896.68, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (331, 198, '2023-10-17', '2023-10-28', 308024.55, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (350, 252, '2024-09-19', '2024-09-24', 471, 172573.13, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (461, 79, '2024-04-10', '2024-04-19', 375, 439722.16, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (90, 494, '2024-02-02', '2024-02-07', 413, 440968.75, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (154, 74, '2023-02-13', '2023-02-21', 205185.73, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (206, 65, '2025-05-10', '2025-05-21', 214, 176470.69, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (236, 376, '2024-04-08', '2024-04-16', 341, 476187.07, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (205, 69, '2025-01-10', '2025-01-19', 100, 102957.54, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (486, 448, '2025-01-16', '2025-01-27', 442, 392062.89, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (392, 406, '2024-02-23', '2024-02-29', 56, 322000.02, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (278, 334, '2024-04-08', '2024-04-13', 452338.03, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (212, 27, '2023-07-24', '2023-07-28', 168841.58, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (480, 265, '2024-03-18', '2024-03-21', 291, 471599.64, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (342, 89, '2023-10-07', '2023-10-19', 340315.08, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (295, 401, '2025-03-31', '2025-04-04', 379, 75341.63, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (67, 391, '2025-08-11', '2025-08-19', 158107.30, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (377, 322, '2025-06-15', '2025-06-16', 5, 338094.70, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (472, 442, '2025-06-09', '2025-06-10', 165754.32, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (183, 104, '2025-01-31', '2025-02-03', 320, 478978.29, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (466, 162, '2024-08-20', '2024-09-03', 156, 223308.51, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (52, 411, '2024-07-29', '2024-08-01', 273, 450408.53, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (467, 317, '2024-02-24', '2024-02-27', 280832.04, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (144, 354, '2025-05-18', '2025-05-22', 228, 488062.36, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (50, 387, '2023-02-10', '2023-02-13', 393, 440115.90, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (11, 301, '2024-12-05', '2024-12-19', 230, 181192.11, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (458, 11, '2024-05-18', '2024-05-29', 283391.50, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (454, 190, '2023-03-12', '2023-03-15', 77, 67471.70, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (57, 479, '2025-03-20', '2025-03-31', 406, 98565.91, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (486, 403, '2023-03-27', '2023-04-02', 457, 301406.28, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (303, 214, '2023-06-23', '2023-06-29', 267, 425626.41, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (463, 469, '2023-01-25', '2023-02-02', 159283.78, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (359, 157, '2023-09-27', '2023-10-05', 389, 498076.97, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (337, 235, '2024-11-06', '2024-11-08', 166459.43, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (475, 320, '2023-01-11', '2023-01-23', 241, 286826.30, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (195, 199, '2023-02-06', '2023-02-18', 412, 335951.96, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (263, 438, '2025-03-13', '2025-03-20', 203597.52, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (369, 134, '2024-07-19', '2024-07-23', 244415.21, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (471, 344, '2023-03-28', '2023-04-10', 59, 333111.30, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (12, 416, '2023-05-12', '2023-05-25', 34, 381031.68, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (79, 293, '2025-03-31', '2025-04-04', 7, 389438.34, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (378, 414, '2023-12-16', '2023-12-30', 495, 454455.71, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (447, 497, '2024-04-16', '2024-04-27', 63, 436700.72, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (29, 361, '2023-05-23', '2023-05-27', 368, 459001.09, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (488, 47, '2023-01-04', '2023-01-11', 41, 395796.36, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (199, 165, '2024-10-02', '2024-10-11', 96319.29, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (254, 310, '2024-12-24', '2024-12-27', 441, 234605.23, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (32, 227, '2023-07-09', '2023-07-18', 74, 3156.70, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (450, 278, '2024-08-12', '2024-08-16', 96, 349983.51, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (435, 165, '2025-02-13', '2025-02-17', 308, 81211.79, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (212, 260, '2024-10-17', '2024-10-22', 124, 109129.11, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (272, 4, '2024-11-01', '2024-11-12', 33, 125834.09, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (253, 177, '2025-07-13', '2025-07-25', 346, 30201.99, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (392, 461, '2025-01-03', '2025-01-11', 302, 5999.47, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (395, 470, '2025-07-25', '2025-07-31', 349037.99, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (292, 135, '2025-01-14', '2025-01-28', 159531.99, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (190, 256, '2023-11-04', '2023-11-17', 244543.73, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (117, 301, '2023-06-24', '2023-06-25', 345432.31, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (167, 473, '2025-03-26', '2025-04-09', 472606.57, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (238, 232, '2023-06-06', '2023-06-09', 368929.60, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (448, 72, '2025-03-18', '2025-03-24', 188, 190728.68, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (8, 223, '2025-03-21', '2025-04-04', 95, 330886.04, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (112, 49, '2023-01-17', '2023-01-24', 255, 236144.11, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (201, 82, '2023-11-07', '2023-11-21', 250, 477597.88, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (311, 371, '2024-05-26', '2024-06-02', 341, 217553.79, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (31, 181, '2025-09-11', '2025-09-13', 149, 33453.04, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (73, 121, '2024-06-15', '2024-06-23', 158, 401811.02, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (324, 82, '2023-12-13', '2023-12-24', 155305.96, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (307, 67, '2024-06-26', '2024-07-01', 170548.62, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (66, 190, '2024-08-01', '2024-08-09', 108, 31562.50, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (484, 168, '2024-12-05', '2024-12-09', 455073.06, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (462, 498, '2024-05-02', '2024-05-15', 140265.67, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (358, 100, '2025-07-12', '2025-07-15', 467, 482736.95, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (118, 363, '2024-08-30', '2024-09-09', 241, 118508.94, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (456, 10, '2023-11-17', '2023-11-26', 165, 440364.08, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (42, 271, '2024-05-17', '2024-05-25', 301299.89, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (137, 35, '2024-04-05', '2024-04-12', 74, 388716.61, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (187, 435, '2025-03-07', '2025-03-08', 183, 236873.47, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (423, 318, '2024-05-09', '2024-05-18', 161, 73060.10, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (310, 453, '2024-07-03', '2024-07-07', 412068.22, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (306, 310, '2023-05-04', '2023-05-09', 410, 366709.96, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (259, 145, '2023-09-12', '2023-09-25', 188004.45, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (153, 134, '2023-07-29', '2023-08-01', 148051.69, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (216, 41, '2024-01-13', '2024-01-21', 196, 387898.45, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (285, 81, '2024-08-31', '2024-09-08', 142, 379230.78, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (102, 362, '2024-09-13', '2024-09-21', 9, 142381.39, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (64, 27, '2025-06-07', '2025-06-13', 369, 276287.56, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (193, 282, '2023-01-27', '2023-02-07', 314, 217129.81, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (429, 390, '2023-02-05', '2023-02-16', 453, 141454.46, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (262, 29, '2025-01-10', '2025-01-22', 356832.06, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (72, 78, '2023-04-15', '2023-04-24', 185, 81690.87, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (498, 183, '2023-12-13', '2023-12-15', 280, 206320.89, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (32, 269, '2024-03-02', '2024-03-13', 46, 394864.35, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (417, 107, '2024-04-04', '2024-04-07', 123, 57624.57, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (29, 331, '2024-11-30', '2024-12-09', 12112.60, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (246, 22, '2023-02-13', '2023-02-17', 379263.87, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (71, 257, '2023-11-24', '2023-11-30', 262, 193762.63, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (392, 149, '2024-05-19', '2024-05-20', 21, 334821.04, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (103, 302, '2023-02-06', '2023-02-10', 42, 114753.00, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (298, 452, '2024-01-12', '2024-01-21', 275, 449289.49, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (4, 469, '2024-10-04', '2024-10-16', 199, 311395.93, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (82, 428, '2023-07-26', '2023-08-08', 134, 303809.26, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (202, 62, '2024-10-28', '2024-11-02', 225824.89, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (344, 263, '2025-02-27', '2025-03-06', 55, 102295.03, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (381, 478, '2025-06-14', '2025-06-18', 100071.32, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (427, 354, '2024-11-21', '2024-11-25', 28, 443326.08, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (332, 321, '2023-08-24', '2023-09-03', 13, 445103.26, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (159, 7, '2023-08-10', '2023-08-24', 369, 90459.57, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (199, 369, '2023-12-02', '2023-12-10', 252, 492114.74, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (246, 288, '2024-09-03', '2024-09-08', 397501.59, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (40, 316, '2023-04-20', '2023-04-21', 426340.70, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (485, 141, '2025-08-10', '2025-08-11', 82, 151723.27, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (50, 28, '2024-01-12', '2024-01-16', 322886.06, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (191, 39, '2023-10-14', '2023-10-21', 62, 326812.99, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (155, 73, '2023-09-27', '2023-10-05', 465062.88, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (105, 62, '2025-07-30', '2025-08-10', 477, 372130.27, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (478, 244, '2023-06-28', '2023-06-29', 454, 56293.38, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (297, 356, '2024-07-24', '2024-07-29', 375, 135033.42, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (355, 79, '2023-08-09', '2023-08-11', 222, 198769.47, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (426, 239, '2024-02-27', '2024-03-01', 33, 486453.56, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (492, 395, '2025-06-16', '2025-06-21', 137, 354950.87, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (13, 344, '2023-10-06', '2023-10-20', 94034.91, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (333, 23, '2025-06-13', '2025-06-23', 417696.24, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (251, 406, '2023-08-26', '2023-09-07', 307, 424228.28, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (189, 234, '2025-04-20', '2025-04-28', 272295.37, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (372, 283, '2024-07-07', '2024-07-10', 298, 160355.62, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (206, 191, '2024-04-23', '2024-04-29', 383656.64, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (456, 254, '2024-11-22', '2024-12-01', 130, 203912.89, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (454, 71, '2023-12-07', '2023-12-13', 349, 322732.07, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (85, 456, '2023-02-13', '2023-02-19', 253176.44, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (307, 175, '2024-07-07', '2024-07-18', 416006.55, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (72, 418, '2025-03-22', '2025-03-26', 412342.75, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (451, 58, '2024-05-28', '2024-06-06', 479, 20989.21, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (282, 341, '2025-08-22', '2025-08-25', 369855.63, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (251, 60, '2023-11-30', '2023-12-12', 418234.39, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (268, 337, '2025-04-19', '2025-04-26', 385, 109535.71, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (55, 116, '2024-10-17', '2024-10-28', 226827.04, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (97, 367, '2023-01-01', '2023-01-14', 469, 484640.23, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (37, 356, '2025-08-30', '2025-09-04', 120916.67, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (278, 327, '2023-04-09', '2023-04-23', 107, 95503.29, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (96, 424, '2025-03-05', '2025-03-16', 35668.08, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (217, 484, '2024-01-02', '2024-01-13', 199, 201500.40, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (192, 107, '2023-11-08', '2023-11-15', 309628.89, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (304, 22, '2024-11-26', '2024-12-04', 131, 488506.73, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (359, 243, '2025-05-31', '2025-06-13', 353, 191877.64, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (301, 318, '2025-06-20', '2025-06-26', 474561.15, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (195, 20, '2025-09-12', '2025-09-20', 48, 379524.74, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (43, 126, '2025-01-11', '2025-01-25', 384, 357804.24, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (173, 124, '2024-09-10', '2024-09-18', 17171.07, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (438, 232, '2023-08-10', '2023-08-20', 442, 205303.55, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (346, 400, '2023-01-29', '2023-02-07', 357, 222214.99, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (290, 199, '2025-03-31', '2025-04-09', 358, 326851.16, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (265, 252, '2023-06-28', '2023-07-06', 170, 146694.74, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (219, 57, '2024-12-04', '2024-12-07', 128, 484282.38, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (3, 199, '2025-03-05', '2025-03-17', 403401.33, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (23, 155, '2023-07-07', '2023-07-11', 170035.21, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (118, 366, '2024-03-31', '2024-04-13', 72, 350390.01, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (68, 380, '2025-08-27', '2025-09-06', 358, 281385.38, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (221, 11, '2024-12-26', '2025-01-04', 215, 448844.73, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (243, 18, '2023-10-13', '2023-10-20', 135, 278640.78, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (450, 486, '2024-11-11', '2024-11-17', 476, 237312.76, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (449, 71, '2023-05-04', '2023-05-05', 80997.66, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (229, 338, '2024-07-13', '2024-07-19', 278684.24, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (337, 95, '2024-08-19', '2024-08-26', 154, 57924.91, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (69, 383, '2024-12-19', '2024-12-26', 5596.81, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (58, 269, '2024-11-12', '2024-11-17', 292786.43, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (71, 164, '2025-07-31', '2025-08-04', 244, 430292.84, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (245, 246, '2023-08-08', '2023-08-10', 86208.99, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (440, 412, '2023-03-14', '2023-03-17', 390, 333541.17, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (35, 245, '2024-06-09', '2024-06-11', 283078.70, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (430, 321, '2024-01-06', '2024-01-10', 413987.82, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (22, 446, '2023-11-25', '2023-12-08', 197314.42, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (192, 201, '2024-04-05', '2024-04-15', 418186.22, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (246, 315, '2025-08-30', '2025-09-12', 254773.64, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (326, 81, '2023-09-05', '2023-09-15', 308, 260629.25, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (16, 214, '2023-03-09', '2023-03-18', 329, 42421.33, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (21, 190, '2023-10-12', '2023-10-19', 140416.74, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (175, 156, '2025-05-06', '2025-05-15', 302647.93, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (241, 262, '2024-05-14', '2024-05-21', 287, 378708.85, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (473, 350, '2024-09-11', '2024-09-21', 47, 330504.41, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (355, 251, '2023-12-17', '2023-12-26', 138, 258498.79, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (479, 139, '2025-06-14', '2025-06-19', 297216.91, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (166, 465, '2023-09-03', '2023-09-13', 172, 95633.29, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (266, 347, '2024-02-26', '2024-03-02', 131955.07, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (394, 314, '2025-06-30', '2025-07-13', 352, 69638.84, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (352, 186, '2024-12-30', '2025-01-08', 267, 276451.60, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (89, 61, '2025-01-11', '2025-01-23', 405, 438072.84, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (325, 426, '2023-12-12', '2023-12-15', 201, 443636.63, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (248, 368, '2023-10-05', '2023-10-15', 37, 229539.61, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (130, 64, '2024-01-21', '2024-02-04', 416, 275341.71, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (479, 131, '2025-08-08', '2025-08-16', 142, 227380.28, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (262, 291, '2024-03-06', '2024-03-10', 132850.60, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (251, 305, '2023-04-21', '2023-04-29', 63, 218586.11, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (186, 390, '2025-03-31', '2025-04-01', 275, 20517.31, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (138, 66, '2025-03-13', '2025-03-15', 457, 462873.90, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (339, 291, '2023-03-03', '2023-03-04', 55716.02, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (146, 221, '2023-09-04', '2023-09-08', 110218.80, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (476, 283, '2023-12-29', '2024-01-12', 391, 118181.17, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (113, 88, '2025-04-05', '2025-04-19', 83, 191636.00, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (47, 293, '2025-01-28', '2025-02-07', 49, 489336.25, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (127, 433, '2024-02-21', '2024-02-25', 121012.25, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (470, 113, '2023-10-14', '2023-10-16', 441, 1584.18, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (308, 435, '2024-01-31', '2024-02-08', 365, 106693.91, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (228, 227, '2023-06-03', '2023-06-15', 444059.21, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (12, 278, '2025-02-22', '2025-02-27', 449, 102564.38, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (269, 176, '2023-11-26', '2023-11-27', 249516.08, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (311, 106, '2024-01-17', '2024-01-20', 351728.19, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (194, 87, '2025-03-17', '2025-03-24', 128, 103565.46, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (367, 149, '2025-07-09', '2025-07-13', 189722.03, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (352, 479, '2024-07-30', '2024-08-03', 322738.63, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (12, 200, '2024-08-08', '2024-08-14', 229, 179760.29, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (466, 218, '2023-04-02', '2023-04-09', 134, 127462.87, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (246, 81, '2023-06-22', '2023-06-26', 415, 426823.47, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (101, 434, '2023-02-07', '2023-02-14', 469, 182285.92, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (82, 48, '2024-09-22', '2024-10-04', 131, 276412.01, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (232, 77, '2023-10-28', '2023-10-31', 429250.13, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (118, 210, '2023-11-16', '2023-11-19', 27, 260253.98, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (294, 336, '2025-03-12', '2025-03-25', 435913.94, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (148, 281, '2024-04-26', '2024-05-03', 447461.00, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (101, 309, '2024-12-30', '2025-01-01', 33691.05, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (92, 274, '2023-05-08', '2023-05-21', 231268.56, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (79, 274, '2025-08-12', '2025-08-15', 122823.27, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (393, 140, '2024-06-09', '2024-06-23', 70, 10358.98, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (86, 25, '2024-04-25', '2024-04-28', 423268.56, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (189, 294, '2025-03-12', '2025-03-17', 231202.61, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (366, 128, '2023-06-15', '2023-06-26', 303005.38, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (70, 1, '2023-10-22', '2023-10-30', 264446.53, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (282, 278, '2025-01-13', '2025-01-20', 444396.35, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (267, 182, '2025-03-16', '2025-03-26', 129, 288735.94, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (269, 480, '2024-02-22', '2024-02-25', 251576.27, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (106, 38, '2024-09-06', '2024-09-12', 420973.01, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (196, 193, '2023-11-03', '2023-11-09', 11937.92, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (111, 223, '2025-03-04', '2025-03-15', 389, 375173.75, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (384, 72, '2024-10-26', '2024-11-08', 117, 150986.07, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (463, 225, '2023-09-16', '2023-09-24', 105, 199619.59, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (238, 67, '2024-03-01', '2024-03-02', 122683.00, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (52, 152, '2024-01-19', '2024-01-20', 175277.56, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (447, 222, '2023-03-21', '2023-03-31', 21, 146975.52, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (479, 445, '2025-05-17', '2025-05-25', 260, 33877.83, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (85, 6, '2023-04-14', '2023-04-17', 261, 372168.86, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (112, 323, '2024-06-17', '2024-06-23', 12069.92, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (236, 178, '2024-09-28', '2024-10-04', 64, 142463.58, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (453, 225, '2025-02-15', '2025-02-23', 216704.09, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (281, 374, '2025-02-05', '2025-02-15', 423, 252973.87, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (194, 170, '2024-11-07', '2024-11-19', 73, 219930.73, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (391, 469, '2023-07-21', '2023-07-23', 23, 308437.18, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (156, 7, '2025-09-03', '2025-09-06', 423, 97246.72, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (453, 78, '2024-03-13', '2024-03-22', 34, 284093.41, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (84, 440, '2023-02-08', '2023-02-13', 469, 363618.97, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (85, 474, '2024-11-19', '2024-11-27', 57118.51, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (176, 316, '2025-01-15', '2025-01-21', 286, 425296.92, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (281, 456, '2025-07-11', '2025-07-25', 80, 371055.67, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (342, 350, '2025-05-05', '2025-05-17', 294889.79, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (399, 460, '2023-09-09', '2023-09-13', 482, 407465.93, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (261, 154, '2024-05-25', '2024-06-06', 411, 495656.45, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (442, 132, '2023-04-20', '2023-05-04', 73985.98, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (451, 490, '2023-09-12', '2023-09-20', 452587.33, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (259, 186, '2024-02-27', '2024-03-10', 125, 199925.35, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (84, 320, '2024-05-07', '2024-05-18', 33160.30, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (224, 208, '2025-04-14', '2025-04-21', 481, 77022.97, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (190, 61, '2023-11-12', '2023-11-16', 243259.98, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (203, 302, '2023-08-08', '2023-08-15', 412, 215052.82, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (85, 173, '2023-06-13', '2023-06-23', 43, 163571.45, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (43, 408, '2025-01-25', '2025-01-26', 75023.12, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (479, 497, '2025-03-23', '2025-04-05', 242, 348691.75, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (91, 17, '2023-05-17', '2023-05-22', 491850.53, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (424, 359, '2024-01-01', '2024-01-12', 285998.63, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (170, 52, '2023-02-09', '2023-02-19', 473, 41172.90, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (99, 405, '2023-06-24', '2023-07-01', 150, 412095.46, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (316, 429, '2024-06-22', '2024-06-24', 311, 415901.11, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (437, 134, '2023-06-11', '2023-06-22', 115, 388037.58, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (353, 146, '2023-02-02', '2023-02-09', 426078.22, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (415, 232, '2024-01-03', '2024-01-12', 153199.38, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (215, 414, '2025-08-10', '2025-08-14', 397128.75, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (108, 124, '2024-04-17', '2024-04-20', 449, 351617.31, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (61, 76, '2023-04-21', '2023-04-29', 171, 63054.87, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (353, 164, '2024-08-16', '2024-08-20', 330, 359320.24, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (343, 483, '2024-11-18', '2024-11-27', 364690.23, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (459, 243, '2024-11-02', '2024-11-03', 26, 182104.67, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (17, 431, '2025-05-23', '2025-06-05', 338, 126090.98, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (495, 204, '2025-03-13', '2025-03-25', 431287.20, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (382, 495, '2024-12-25', '2025-01-01', 329202.41, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (445, 359, '2023-07-08', '2023-07-09', 48, 434587.08, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (250, 449, '2023-12-09', '2023-12-12', 254, 21012.74, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (491, 143, '2025-07-18', '2025-07-22', 360392.19, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (324, 185, '2024-12-29', '2025-01-04', 248, 400104.31, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (396, 423, '2024-05-28', '2024-06-01', 105530.88, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (378, 381, '2024-06-01', '2024-06-06', 265434.55, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (314, 475, '2024-09-18', '2024-09-22', 217468.83, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (233, 494, '2025-01-06', '2025-01-16', 273561.59, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (23, 146, '2023-12-07', '2023-12-08', 203668.15, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (243, 425, '2025-06-18', '2025-06-25', 464524.20, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (119, 473, '2023-11-19', '2023-12-03', 334, 295446.83, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (437, 20, '2025-04-16', '2025-04-20', 3, 334216.11, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (272, 118, '2023-02-11', '2023-02-15', 221, 476004.29, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (25, 491, '2023-03-19', '2023-04-01', 401641.91, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (482, 214, '2023-01-17', '2023-01-26', 434272.96, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (404, 157, '2025-02-26', '2025-03-08', 274, 331657.10, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (339, 283, '2023-10-22', '2023-11-04', 57935.83, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (288, 372, '2023-12-03', '2023-12-06', 272531.63, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (41, 169, '2024-10-24', '2024-10-28', 384, 473289.28, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (375, 133, '2023-06-23', '2023-07-04', 219, 146158.31, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (105, 374, '2023-06-17', '2023-06-23', 278, 48802.16, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (355, 281, '2024-10-16', '2024-10-18', 480, 38112.89, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (2, 489, '2023-09-03', '2023-09-05', 389332.44, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (495, 92, '2023-04-27', '2023-05-10', 225645.80, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (400, 274, '2024-04-21', '2024-04-30', 43, 61048.76, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (183, 404, '2023-04-05', '2023-04-11', 129, 88199.27, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (372, 10, '2025-07-21', '2025-07-31', 33, 402187.67, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (84, 75, '2023-12-17', '2023-12-20', 474, 261043.35, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (388, 324, '2023-12-26', '2023-12-27', 170090.39, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (54, 414, '2024-06-08', '2024-06-21', 327, 405904.72, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (248, 397, '2024-08-23', '2024-09-04', 348677.34, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (428, 337, '2025-08-14', '2025-08-27', 329, 247187.59, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (189, 102, '2025-07-10', '2025-07-11', 9, 18189.74, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (341, 479, '2024-01-17', '2024-01-28', 162, 169362.81, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (442, 238, '2023-03-29', '2023-04-01', 60, 421511.19, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (304, 70, '2024-04-29', '2024-05-07', 276792.53, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (62, 320, '2025-04-10', '2025-04-11', 275, 393073.11, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (421, 218, '2023-10-28', '2023-10-29', 494, 429328.46, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (71, 357, '2023-09-22', '2023-10-06', 211, 189790.58, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (39, 500, '2024-06-27', '2024-07-03', 12, 37555.83, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (14, 146, '2023-12-02', '2023-12-05', 355900.15, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (309, 307, '2025-05-22', '2025-05-24', 171, 181266.08, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (163, 455, '2023-05-07', '2023-05-10', 26, 288205.68, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (142, 160, '2025-05-11', '2025-05-24', 275104.19, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (416, 365, '2024-07-16', '2024-07-26', 435150.21, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (337, 153, '2023-04-13', '2023-04-20', 376150.97, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (216, 48, '2024-11-04', '2024-11-10', 486, 134524.09, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (484, 302, '2023-01-05', '2023-01-07', 445701.19, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (208, 278, '2023-04-20', '2023-04-25', 79403.47, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (127, 42, '2023-12-09', '2023-12-12', 92564.60, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (54, 323, '2025-04-11', '2025-04-12', 378, 235157.84, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (491, 421, '2025-06-03', '2025-06-14', 268, 254842.23, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (449, 140, '2024-08-13', '2024-08-26', 122, 364925.64, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (31, 221, '2023-08-05', '2023-08-15', 177, 333441.14, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (70, 208, '2024-08-27', '2024-09-03', 439, 455373.12, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (456, 64, '2024-12-24', '2024-12-31', 59, 127499.64, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (208, 303, '2023-07-15', '2023-07-27', 329, 126468.11, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (298, 62, '2024-11-18', '2024-11-22', 66224.29, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (382, 24, '2025-01-18', '2025-01-20', 492, 342034.08, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (58, 295, '2023-01-03', '2023-01-14', 105102.48, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (212, 55, '2023-12-16', '2023-12-20', 223537.25, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (64, 445, '2024-01-13', '2024-01-19', 141, 488625.00, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (228, 340, '2023-07-26', '2023-08-09', 446, 317525.79, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (341, 440, '2025-08-27', '2025-09-07', 26, 121384.25, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (130, 2, '2024-03-19', '2024-03-27', 79302.55, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (384, 235, '2024-06-20', '2024-06-25', 146, 101919.94, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (144, 91, '2024-03-12', '2024-03-25', 301, 6883.81, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (233, 179, '2023-11-07', '2023-11-18', 112157.87, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (430, 245, '2024-02-04', '2024-02-09', 80229.15, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (9, 400, '2023-08-29', '2023-09-09', 242951.28, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (261, 329, '2025-08-14', '2025-08-17', 354, 54912.20, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (51, 140, '2025-06-01', '2025-06-12', 33, 258240.26, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (291, 491, '2025-06-25', '2025-06-27', 120612.89, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (388, 491, '2024-11-15', '2024-11-24', 427925.08, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (472, 94, '2024-10-04', '2024-10-12', 488725.87, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (168, 394, '2024-12-07', '2024-12-20', 100, 276936.19, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (96, 56, '2025-01-20', '2025-01-25', 360440.38, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (140, 301, '2023-07-24', '2023-08-04', 200976.84, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (289, 183, '2023-04-09', '2023-04-16', 24, 235927.24, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (440, 173, '2024-01-01', '2024-01-09', 221, 379463.26, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (491, 288, '2023-01-17', '2023-01-29', 211, 38134.14, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (444, 23, '2023-07-29', '2023-08-06', 349, 206179.94, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (500, 281, '2024-03-27', '2024-04-08', 50, 67860.62, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (19, 132, '2023-01-12', '2023-01-22', 204569.09, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (456, 231, '2025-07-03', '2025-07-07', 46741.48, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (48, 413, '2023-09-14', '2023-09-27', 299161.73, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (124, 23, '2024-05-02', '2024-05-14', 138540.75, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (374, 4, '2025-08-06', '2025-08-20', 244774.72, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (455, 170, '2023-04-13', '2023-04-15', 1, 251850.23, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (219, 357, '2023-12-24', '2023-12-30', 379, 376663.69, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (50, 322, '2024-08-08', '2024-08-09', 333649.30, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (120, 378, '2023-02-16', '2023-02-28', 152, 89695.78, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (236, 32, '2024-11-08', '2024-11-16', 468, 112812.59, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (371, 105, '2024-01-11', '2024-01-22', 378294.69, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (222, 79, '2024-12-05', '2024-12-07', 88, 416809.83, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (192, 18, '2024-06-29', '2024-07-02', 392, 342219.82, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (81, 109, '2023-03-16', '2023-03-19', 207526.42, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (86, 137, '2024-12-31', '2025-01-09', 462, 356861.15, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (478, 303, '2025-07-09', '2025-07-19', 305, 492203.76, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (273, 339, '2024-08-03', '2024-08-07', 476809.05, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (407, 228, '2023-10-13', '2023-10-19', 130114.33, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (396, 428, '2023-01-21', '2023-01-25', 475, 202908.08, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (47, 448, '2024-08-18', '2024-08-20', 378, 398300.90, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (359, 274, '2025-08-30', '2025-09-13', 56582.45, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (298, 365, '2025-01-25', '2025-02-08', 119, 67609.07, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (410, 65, '2023-09-04', '2023-09-05', 254207.99, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (124, 276, '2024-07-19', '2024-07-21', 171, 169555.98, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (282, 70, '2025-04-27', '2025-04-30', 22009.28, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (72, 412, '2025-03-19', '2025-03-23', 227, 349387.76, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (37, 217, '2025-01-08', '2025-01-19', 85, 273363.14, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (349, 142, '2025-05-17', '2025-05-23', 14980.06, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (397, 341, '2024-12-08', '2024-12-09', 85, 431442.89, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (388, 381, '2025-04-07', '2025-04-18', 488, 292920.27, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (413, 51, '2024-03-25', '2024-04-07', 323, 447147.15, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (384, 496, '2024-09-11', '2024-09-12', 345, 359612.70, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (59, 407, '2025-07-25', '2025-08-03', 44, 322803.52, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (280, 417, '2023-06-01', '2023-06-11', 268, 334071.78, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (467, 394, '2023-03-20', '2023-03-23', 404, 87862.48, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (22, 161, '2024-01-24', '2024-02-01', 307, 20191.58, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (26, 2, '2024-11-08', '2024-11-13', 442896.39, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (46, 186, '2025-01-11', '2025-01-20', 63, 137539.66, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (121, 212, '2023-06-02', '2023-06-15', 339, 134704.64, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (26, 188, '2023-11-14', '2023-11-28', 85117.83, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (283, 366, '2023-02-10', '2023-02-21', 309, 234884.61, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (439, 315, '2024-07-25', '2024-08-02', 320, 309045.55, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (399, 326, '2025-09-02', '2025-09-16', 138, 462321.18, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (411, 25, '2025-08-08', '2025-08-10', 456, 432625.66, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (285, 469, '2024-06-25', '2024-07-07', 439, 2485.86, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (330, 91, '2024-07-14', '2024-07-22', 194, 249223.61, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (368, 392, '2023-07-12', '2023-07-21', 345, 323871.28, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (34, 73, '2024-12-14', '2024-12-21', 293, 309537.34, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (331, 343, '2024-11-13', '2024-11-25', 451, 153748.30, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (215, 388, '2025-01-04', '2025-01-07', 110, 184128.26, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (54, 159, '2025-09-10', '2025-09-23', 200, 125924.96, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (150, 485, '2024-10-08', '2024-10-15', 149, 78336.01, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (444, 448, '2023-02-13', '2023-02-16', 201639.59, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (175, 279, '2024-11-30', '2024-12-03', 146916.55, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (12, 343, '2023-03-28', '2023-04-05', 149, 188635.57, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (263, 295, '2025-09-10', '2025-09-24', 116, 265177.47, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (375, 56, '2024-01-13', '2024-01-17', 142, 278045.16, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (170, 372, '2023-05-18', '2023-05-26', 305047.62, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (175, 20, '2023-10-24', '2023-11-04', 105, 319540.64, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (470, 111, '2023-08-02', '2023-08-15', 301, 411968.78, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (162, 453, '2024-12-26', '2024-12-28', 53, 197360.00, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (47, 49, '2024-12-29', '2025-01-08', 227371.96, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (64, 279, '2023-02-19', '2023-03-01', 348, 487795.13, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (102, 253, '2023-08-10', '2023-08-13', 452, 202497.25, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (209, 438, '2023-02-05', '2023-02-17', 38420.31, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (390, 259, '2024-05-23', '2024-06-05', 492, 480850.49, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (257, 440, '2024-02-21', '2024-03-05', 276274.91, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (6, 467, '2023-07-09', '2023-07-13', 55, 410174.43, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (172, 399, '2024-02-29', '2024-03-02', 7, 274870.22, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (126, 353, '2024-01-22', '2024-01-28', 146, 236136.51, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (422, 306, '2023-05-03', '2023-05-15', 453968.42, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (349, 110, '2024-02-06', '2024-02-12', 304871.31, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (40, 160, '2024-09-10', '2024-09-12', 404256.81, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (295, 147, '2023-04-22', '2023-05-01', 176, 146121.74, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (430, 14, '2024-08-23', '2024-08-26', 371, 378260.59, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (81, 483, '2023-08-09', '2023-08-19', 141, 300982.29, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (172, 173, '2024-03-04', '2024-03-06', 46112.37, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (439, 375, '2023-10-29', '2023-11-01', 259840.12, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (425, 188, '2024-10-07', '2024-10-08', 203, 389009.22, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (220, 223, '2025-03-20', '2025-04-01', 66, 23179.20, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (219, 400, '2025-05-16', '2025-05-17', 469422.61, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (29, 267, '2025-06-25', '2025-06-29', 180661.05, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (419, 447, '2025-02-20', '2025-02-21', 482, 193142.06, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (382, 109, '2023-04-13', '2023-04-16', 27, 383797.32, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (419, 221, '2024-06-05', '2024-06-14', 434, 91701.95, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (249, 218, '2025-02-20', '2025-03-01', 269, 322075.47, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (426, 136, '2023-10-25', '2023-11-06', 284, 481564.53, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (3, 407, '2024-06-24', '2024-07-02', 442, 390121.63, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (342, 468, '2024-07-17', '2024-07-29', 120, 446862.44, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (331, 192, '2024-09-21', '2024-10-03', 354, 62068.56, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (356, 10, '2024-09-12', '2024-09-26', 363, 23745.63, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (34, 412, '2023-10-24', '2023-10-29', 287043.75, 'Hủy');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (232, 131, '2024-08-19', '2024-09-01', 82800.52, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (320, 483, '2024-10-02', '2024-10-09', 400, 383314.25, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (337, 152, '2025-04-30', '2025-05-09', 320874.66, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (347, 348, '2025-02-18', '2025-03-04', 275, 228101.13, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (402, 188, '2024-08-16', '2024-08-23', 290, 318388.50, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (53, 151, '2023-01-22', '2023-02-04', 250219.19, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (500, 439, '2023-07-19', '2023-07-22', 445269.84, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (414, 420, '2023-08-17', '2023-08-22', 289, 390264.06, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (287, 492, '2025-08-18', '2025-08-19', 203909.55, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (243, 80, '2024-02-12', '2024-02-23', 58858.33, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (16, 329, '2024-03-28', '2024-03-31', 374638.28, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (371, 117, '2024-06-16', '2024-06-26', 110198.67, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (186, 333, '2023-09-07', '2023-09-16', 69261.53, 'Check-out');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (429, 420, '2023-10-19', '2023-11-02', 340, 1536.12, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (61, 73, '2025-07-12', '2025-07-24', 412, 283133.92, 'Check-in');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (435, 402, '2023-05-31', '2023-06-07', 295256.07, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai) VALUES (223, 339, '2023-09-30', '2023-10-02', 209, 391800.42, 'Đã đặt');
INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (323, 38, '2025-08-03', '2025-08-17', 108316.05, 'Check-in');
GO



--Stored Procedure
CREATE PROCEDURE sp_DatPhong
    @MaKhachHang INT,
    @MaPhong INT,
    @NgayDat DATETIME,
    @NgayTra DATETIME,
    @MaHoaDon INT,
    @DatCoc DECIMAL(18,2) = 0,
    @TrangThai NVARCHAR(50) = 'Đã đặt'
AS
BEGIN
    INSERT INTO DatPhong (MaKhachHang, MaPhong, NgayDat, NgayTra, DatCoc, TrangThai) VALUES (@MaKhachHang, @MaPhong, @NgayDat, @NgayTra, @DatCoc, @TrangThai)
END;
GO

------------------
CREATE PROCEDURE sp_ThanhToan
    @MaKhachHang INT,
    @DanhSachPhong NVARCHAR(MAX), --(vd: '101,102')
    @PhuongThuc NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @TongHoaDon DECIMAL(18,2);

        SELECT @TongHoaDon = SUM(p.GiaPhong * DATEDIFF(DAY, dp.NgayDat, dp.NgayTra))
        FROM DatPhong dp
        JOIN Phong p ON dp.MaPhong = p.MaPhong
        WHERE dp.MaKhachHang = @MaKhachHang
          AND dp.MaPhong IN (SELECT value FROM STRING_SPLIT(@DanhSachPhong, ','))
          AND dp.MaHoaDon IS NULL
          AND dp.TrangThai = N'Check-in';

        IF @TongHoaDon IS NULL
        BEGIN
            RAISERROR(N'Không có phòng hợp lệ để thanh toán.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        INSERT INTO HoaDon(MaKhachHang, TongHoaDon, TrangThai, PhuongThuc, NgayThanhToan)
        VALUES (@MaKhachHang, @TongHoaDon, N'Hoàn tất', @PhuongThuc, GETDATE());

        DECLARE @MaHoaDon INT = SCOPE_IDENTITY();

        UPDATE DatPhong
        SET MaHoaDon = @MaHoaDon,
            TrangThai = N'Check-out'
        WHERE MaKhachHang = @MaKhachHang
          AND MaPhong IN (SELECT value FROM STRING_SPLIT(@DanhSachPhong, ','))
          AND MaHoaDon IS NULL
          AND TrangThai = N'Check-in';

        UPDATE Phong
        SET TrangThai = N'Trống'
        WHERE MaPhong IN (SELECT value FROM STRING_SPLIT(@DanhSachPhong, ','));

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


------------------
CREATE PROCEDURE sp_CheckIn
    @MaDatPhong INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @MaPhong INT;

        SELECT @MaPhong = MaPhong
        FROM DatPhong
        WHERE MaDatPhong = @MaDatPhong;

        UPDATE DatPhong
        SET TrangThai = N'Check in'
        WHERE MaDatPhong = @MaDatPhong;

        UPDATE Phong
        SET TrangThai = N'Đang sử dụng'
        WHERE MaPhong = @MaPhong;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


CREATE PROCEDURE sp_CheckOut
    @MaDatPhong INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @MaPhong INT;

        SELECT @MaPhong = MaPhong
        FROM DatPhong
        WHERE MaDatPhong = @MaDatPhong;

        UPDATE DatPhong
        SET TrangThai = N'Check-out'
        WHERE MaDatPhong = @MaDatPhong;

        UPDATE Phong
        SET TrangThai = N'Trống'
        WHERE MaPhong = @MaPhong;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


CREATE PROCEDURE sp_TinhTongTienHoaDon
    @MaHoaDon INT,
    @CapNhat BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @KetQua DECIMAL(18,2) = 0;

    SELECT @KetQua = ISNULL(SUM(
        P.GiaPhong *
        CASE WHEN DATEDIFF(DAY, DP.NgayDat, DP.NgayTra) = 0 THEN 1
             ELSE DATEDIFF(DAY, DP.NgayDat, DP.NgayTra)
        END
    ),0) - ISNULL((SELECT SUM(DatCoc) FROM DatPhong WHERE MaHoaDon = @MaHoaDon),0)
    FROM DatPhong DP
    JOIN Phong P ON DP.MaPhong = P.MaPhong
    WHERE DP.MaHoaDon = @MaHoaDon;

    IF @CapNhat = 1
    BEGIN
        UPDATE HoaDon SET TongHoaDon = @KetQua WHERE MaHoaDon = @MaHoaDon;
    END
END;
GO

CREATE PROCEDURE sp_HuyDatPhong
    @MaDatPhong INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @MaPhong INT;

        SELECT @MaPhong = MaPhong
        FROM DatPhong
        WHERE MaDatPhong = @MaDatPhong;

        IF @TrangThai = N'Check in' 
        BEGIN
            RAISERROR(N'Không thể hủy khi khách đã nhận phòng', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END
            
        UPDATE DatPhong
        SET TrangThai = N'Hủy'
        WHERE MaDatPhong = @MaDatPhong;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO



--Function
CREATE FUNCTION fn_TinhTienDatPhong(@MaPhong INT,@NgayDat DATETIME, @NgayTra DATETIME)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TongHoaDon DECIMAL(18,2);

    SELECT @TongHoaDon = ISNULL(SUM(
        P.GiaPhong * 
        CASE 
            WHEN DATEDIFF(DAY, @NgayDat, @NgayTra) = 0 THEN 1
            ELSE DATEDIFF(DAY, @NgayDat, @NgayTra)
        END
    ),0)
    FROM Phong P
    Where MaPhong = @MaPhong
    RETURN @TongHoaDon
END;
GO

------------
CREATE FUNCTION fn_KiemTraPhongTrong
(
    @NgayBatDau DATETIME,
    @NgayKetThuc DATETIME,
    @LoaiPhong NVARCHAR(50) = NULL  -- Có thể NULL, nếu NULL thì không lọc theo loại phòng
)
RETURNS TABLE
AS
RETURN
(
    SELECT p.MaPhong, p.LoaiPhong, p.GiaPhong, p.MoTa
    FROM Phong p
    WHERE p.TrangThai = N'Trống'
      AND NOT EXISTS (
            SELECT 1
            FROM DatPhong dp
            WHERE dp.MaPhong = p.MaPhong
              AND dp.TrangThai IN (N'Đã đặt', N'Check-in')
              AND (
                    (@NgayBatDau BETWEEN dp.NgayDat AND dp.NgayTra)
                 OR (@NgayKetThuc BETWEEN dp.NgayDat AND dp.NgayTra)
                 OR (dp.NgayDat BETWEEN @NgayBatDau AND @NgayKetThuc)
                 OR (dp.NgayTra BETWEEN @NgayBatDau AND @NgayKetThuc)
              )
      )
      AND (@LoaiPhong IS NULL OR p.LoaiPhong = @LoaiPhong)
);
GO



--Tringger
CREATE TRIGGER trg_CapNhatTrangThaiPhong
ON DatPhong
AFTER INSERT
AS
BEGIN
    UPDATE P
    SET P.TrangThai = N'Đã Đặt'
    FROM Phong P
    INNER JOIN Inserted I ON P.MaPhong = I.MaPhong;
END;
GO

CREATE TRIGGER trg_KiemTraDatTrung
ON DatPhong
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM DatPhong D
        JOIN Inserted I ON D.MaPhong = I.MaPhong
        WHERE 
          (I.NgayDat BETWEEN D.NgayDat AND D.NgayTra
           OR I.NgayTra BETWEEN D.NgayDat AND D.NgayTra)
          AND D.TrangThai IN (N'Đã Đặt', 'Nhận Phòng')
    )
    BEGIN
        RAISERROR (N'Phòng này đã được đặt trong thời gian đó.',16,1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO DatPhong(MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai)
        SELECT MaKhachHang, MaPhong, NgayDat, NgayTra, MaHoaDon, DatCoc, TrangThai
        FROM Inserted;
    END
END;
GO


--------------
CREATE TRIGGER trg_LogThanhToan
ON HoaDon
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET TrangThai = N'Trống'
    FROM Phong p
    WHERE p.MaPhong IN (
        SELECT dp.MaPhong
        FROM inserted i
        JOIN DatPhong dp ON i.MaHoaDon = dp.MaHoaDon
        WHERE i.TrangThai = N'Hoàn tất'
    );
END;
GO




--Stored Procedure





--Function






--Tringger






