//tạo collections +  chen data  + index

use quanLiDatPhong
db.LSGiaoDich.insertMany([
{ MaGiaoDich: "GD0001", MaKhachHang: 1, TongHoaDon: NumberDecimal("1500000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-08-01T10:15:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 1, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("500000.00"), NgayNhan: ISODate("2025-07-25T14:00:00Z"), NgayTra: ISODate("2025-08-01T12:00:00Z"), TongTien: NumberDecimal("3500000.00") }] },
{ MaGiaoDich: "GD0002", MaKhachHang: 2, TongHoaDon: NumberDecimal("2300000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-07-15T09:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 2, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("800000.00"), NgayNhan: ISODate("2025-07-10T15:00:00Z"), NgayTra: ISODate("2025-07-15T11:00:00Z"), TongTien: NumberDecimal("4000000.00") }] },
{ MaGiaoDich: "GD0003", MaKhachHang: 3, TongHoaDon: NumberDecimal("450000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-06-20T12:30:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 3, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("300000.00"), NgayNhan: ISODate("2025-06-18T09:00:00Z"), NgayTra: ISODate("2025-06-20T10:00:00Z"), TongTien: NumberDecimal("600000.00") }] },
{ MaGiaoDich: "GD0004", MaKhachHang: 4, TongHoaDon: NumberDecimal("980000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-05-03T08:45:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 4, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("450000.00"), NgayNhan: ISODate("2025-04-28T16:00:00Z"), NgayTra: ISODate("2025-05-03T14:00:00Z"), TongTien: NumberDecimal("1350000.00") }] },
{ MaGiaoDich: "GD0005", MaKhachHang: 5, TongHoaDon: NumberDecimal("3200000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-01-10T11:20:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 5, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("1200000.00"), NgayNhan: ISODate("2025-01-01T12:00:00Z"), NgayTra: ISODate("2025-01-10T10:00:00Z"), TongTien: NumberDecimal("10800000.00") }] },
{ MaGiaoDich: "GD0006", MaKhachHang: 6, TongHoaDon: NumberDecimal("750000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2024-12-05T13:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 6, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("600000.00"), NgayNhan: ISODate("2024-12-01T10:00:00Z"), NgayTra: ISODate("2024-12-05T12:00:00Z"), TongTien: NumberDecimal("2400000.00") }] },
{ MaGiaoDich: "GD0007", MaKhachHang: 7, TongHoaDon: NumberDecimal("1250000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-03-18T18:30:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 7, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("550000.00"), NgayNhan: ISODate("2025-03-15T08:00:00Z"), NgayTra: ISODate("2025-03-18T16:00:00Z"), TongTien: NumberDecimal("1650000.00") }] },
{ MaGiaoDich: "GD0008", MaKhachHang: 8, TongHoaDon: NumberDecimal("540000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-02-27T10:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 8, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("350000.00"), NgayNhan: ISODate("2025-02-25T14:00:00Z"), NgayTra: ISODate("2025-02-27T09:00:00Z"), TongTien: NumberDecimal("700000.00") }] },
{ MaGiaoDich: "GD0009", MaKhachHang: 9, TongHoaDon: NumberDecimal("2600000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-04-20T09:10:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 9, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("900000.00"), NgayNhan: ISODate("2025-04-15T11:00:00Z"), NgayTra: ISODate("2025-04-20T08:00:00Z"), TongTien: NumberDecimal("4950000.00") }] },
{ MaGiaoDich: "GD0010", MaKhachHang: 10, TongHoaDon: NumberDecimal("480000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-06-01T07:45:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 10, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("400000.00"), NgayNhan: ISODate("2025-05-30T10:00:00Z"), NgayTra: ISODate("2025-06-01T06:00:00Z"), TongTien: NumberDecimal("440000.00") }] },
{ MaGiaoDich: "GD0011", MaKhachHang: 11, TongHoaDon: NumberDecimal("1100000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-03-05T14:15:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 11, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("700000.00"), NgayNhan: ISODate("2025-03-01T13:00:00Z"), NgayTra: ISODate("2025-03-05T12:00:00Z"), TongTien: NumberDecimal("2800000.00") }] },
{ MaGiaoDich: "GD0012", MaKhachHang: 12, TongHoaDon: NumberDecimal("670000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2024-11-11T16:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 12, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("450000.00"), NgayNhan: ISODate("2024-11-09T15:00:00Z"), NgayTra: ISODate("2024-11-11T14:00:00Z"), TongTien: NumberDecimal("900000.00") }] },
{ MaGiaoDich: "GD0013", MaKhachHang: 13, TongHoaDon: NumberDecimal("2050000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-09-01T11:00:00Z"), TrangThai: "Đang xử lý", DSDatPhong: [{ MaPhong: 13, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("1000000.00"), NgayNhan: ISODate("2025-08-25T09:00:00Z"), NgayTra: ISODate("2025-09-01T10:00:00Z"), TongTien: NumberDecimal("7000000.00") }] },
{ MaGiaoDich: "GD0014", MaKhachHang: 14, TongHoaDon: NumberDecimal("980000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-02-02T08:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 14, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("650000.00"), NgayNhan: ISODate("2025-01-29T07:00:00Z"), NgayTra: ISODate("2025-02-02T06:00:00Z"), TongTien: NumberDecimal("2600000.00") }] },
{ MaGiaoDich: "GD0015", MaKhachHang: 15, TongHoaDon: NumberDecimal("420000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2024-10-20T09:20:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 15, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("350000.00"), NgayNhan: ISODate("2024-10-18T08:00:00Z"), NgayTra: ISODate("2024-10-20T07:00:00Z"), TongTien: NumberDecimal("700000.00") }] },
{ MaGiaoDich: "GD0016", MaKhachHang: 16, TongHoaDon: NumberDecimal("1320000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-04-08T20:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 16, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("550000.00"), NgayNhan: ISODate("2025-04-05T19:00:00Z"), NgayTra: ISODate("2025-04-08T18:00:00Z"), TongTien: NumberDecimal("1650000.00") }] },
{ MaGiaoDich: "GD0017", MaKhachHang: 17, TongHoaDon: NumberDecimal("600000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-06-22T10:30:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 17, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("500000.00"), NgayNhan: ISODate("2025-06-20T09:00:00Z"), NgayTra: ISODate("2025-06-22T08:00:00Z"), TongTien: NumberDecimal("1000000.00") }] },
{ MaGiaoDich: "GD0018", MaKhachHang: 18, TongHoaDon: NumberDecimal("1450000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-05-30T12:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 18, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("850000.00"), NgayNhan: ISODate("2025-05-25T11:00:00Z"), NgayTra: ISODate("2025-05-30T10:00:00Z"), TongTien: NumberDecimal("4250000.00") }] },
{ MaGiaoDich: "GD0019", MaKhachHang: 19, TongHoaDon: NumberDecimal("330000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2024-09-15T08:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 19, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("300000.00"), NgayNhan: ISODate("2024-09-13T07:00:00Z"), NgayTra: ISODate("2024-09-15T06:00:00Z"), TongTien: NumberDecimal("600000.00") }] },
{ MaGiaoDich: "GD0020", MaKhachHang: 20, TongHoaDon: NumberDecimal("2750000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-07-01T15:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 20, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("1100000.00"), NgayNhan: ISODate("2025-06-25T14:00:00Z"), NgayTra: ISODate("2025-07-01T13:00:00Z"), TongTien: NumberDecimal("7700000.00") }] },
{ MaGiaoDich: "GD0021", MaKhachHang: 21, TongHoaDon: NumberDecimal("920000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-03-22T09:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 1, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("650000.00"), NgayNhan: ISODate("2025-03-20T08:00:00Z"), NgayTra: ISODate("2025-03-22T07:00:00Z"), TongTien: NumberDecimal("1300000.00") }] },
{ MaGiaoDich: "GD0022", MaKhachHang: 22, TongHoaDon: NumberDecimal("510000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2024-08-08T10:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 2, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("400000.00"), NgayNhan: ISODate("2024-08-06T09:00:00Z"), NgayTra: ISODate("2024-08-08T08:00:00Z"), TongTien: NumberDecimal("800000.00") }] },
{ MaGiaoDich: "GD0023", MaKhachHang: 23, TongHoaDon: NumberDecimal("1430000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-06-12T14:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 3, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("950000.00"), NgayNhan: ISODate("2025-06-08T13:00:00Z"), NgayTra: ISODate("2025-06-12T12:00:00Z"), TongTien: NumberDecimal("3800000.00") }] },
{ MaGiaoDich: "GD0024", MaKhachHang: 24, TongHoaDon: NumberDecimal("890000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-05-01T09:30:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 4, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("600000.00"), NgayNhan: ISODate("2025-04-28T08:00:00Z"), NgayTra: ISODate("2025-05-01T07:00:00Z"), TongTien: NumberDecimal("1800000.00") }] },
{ MaGiaoDich: "GD0025", MaKhachHang: 25, TongHoaDon: NumberDecimal("150000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2024-07-03T12:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 5, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("250000.00"), NgayNhan: ISODate("2024-07-02T11:00:00Z"), NgayTra: ISODate("2024-07-03T10:00:00Z"), TongTien: NumberDecimal("250000.00") }] },
{ MaGiaoDich: "GD0026", MaKhachHang: 26, TongHoaDon: NumberDecimal("2100000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-01-18T10:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 6, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("1050000.00"), NgayNhan: ISODate("2025-01-12T09:00:00Z"), NgayTra: ISODate("2025-01-18T08:00:00Z"), TongTien: NumberDecimal("6300000.00") }] },
{ MaGiaoDich: "GD0027", MaKhachHang: 27, TongHoaDon: NumberDecimal("770000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-02-14T13:30:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 7, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("500000.00"), NgayNhan: ISODate("2025-02-12T12:00:00Z"), NgayTra: ISODate("2025-02-14T11:00:00Z"), TongTien: NumberDecimal("1000000.00") }] },
{ MaGiaoDich: "GD0028", MaKhachHang: 28, TongHoaDon: NumberDecimal("1300000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-03-30T19:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 8, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("700000.00"), NgayNhan: ISODate("2025-03-27T18:00:00Z"), NgayTra: ISODate("2025-03-30T17:00:00Z"), TongTien: NumberDecimal("2100000.00") }] },
{ MaGiaoDich: "GD0029", MaKhachHang: 29, TongHoaDon: NumberDecimal("410000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2024-06-11T09:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 9, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("300000.00"), NgayNhan: ISODate("2024-06-09T08:00:00Z"), NgayTra: ISODate("2024-06-11T07:00:00Z"), TongTien: NumberDecimal("600000.00") }] },
{ MaGiaoDich: "GD0030", MaKhachHang: 30, TongHoaDon: NumberDecimal("1990000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-08-12T11:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 10, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("950000.00"), NgayNhan: ISODate("2025-08-07T10:00:00Z"), NgayTra: ISODate("2025-08-12T09:00:00Z"), TongTien: NumberDecimal("5700000.00") }] },
{ MaGiaoDich: "GD0031", MaKhachHang: 31, TongHoaDon: NumberDecimal("870000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-05-12T10:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 11, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("550000.00"), NgayNhan: ISODate("2025-05-09T09:00:00Z"), NgayTra: ISODate("2025-05-12T08:00:00Z"), TongTien: NumberDecimal("1650000.00") }] },
{ MaGiaoDich: "GD0032", MaKhachHang: 32, TongHoaDon: NumberDecimal("610000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-04-25T07:30:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 12, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("450000.00"), NgayNhan: ISODate("2025-04-23T06:00:00Z"), NgayTra: ISODate("2025-04-25T05:00:00Z"), TongTien: NumberDecimal("900000.00") }] },
{ MaGiaoDich: "GD0033", MaKhachHang: 33, TongHoaDon: NumberDecimal("2550000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-02-28T09:45:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 13, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("1150000.00"), NgayNhan: ISODate("2025-02-20T08:00:00Z"), NgayTra: ISODate("2025-02-28T07:00:00Z"), TongTien: NumberDecimal("9200000.00") }] },
{ MaGiaoDich: "GD0034", MaKhachHang: 34, TongHoaDon: NumberDecimal("430000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2024-05-05T08:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 14, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("350000.00"), NgayNhan: ISODate("2024-05-03T07:00:00Z"), NgayTra: ISODate("2024-05-05T06:00:00Z"), TongTien: NumberDecimal("700000.00") }] },
{ MaGiaoDich: "GD0035", MaKhachHang: 35, TongHoaDon: NumberDecimal("1700000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-07-18T12:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 15, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("750000.00"), NgayNhan: ISODate("2025-07-14T11:00:00Z"), NgayTra: ISODate("2025-07-18T10:00:00Z"), TongTien: NumberDecimal("3000000.00") }] },
{ MaGiaoDich: "GD0036", MaKhachHang: 36, TongHoaDon: NumberDecimal("540000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-06-02T11:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 16, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("400000.00"), NgayNhan: ISODate("2025-05-31T10:00:00Z"), NgayTra: ISODate("2025-06-02T09:00:00Z"), TongTien: NumberDecimal("800000.00") }] },
{ MaGiaoDich: "GD0037", MaKhachHang: 37, TongHoaDon: NumberDecimal("980000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-08-22T09:10:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 17, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("900000.00"), NgayNhan: ISODate("2025-08-18T08:00:00Z"), NgayTra: ISODate("2025-08-22T07:00:00Z"), TongTien: NumberDecimal("3600000.00") }] },
{ MaGiaoDich: "GD0038", MaKhachHang: 38, TongHoaDon: NumberDecimal("255000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2024-03-12T10:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 18, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("250000.00"), NgayNhan: ISODate("2024-03-11T09:00:00Z"), NgayTra: ISODate("2024-03-12T08:00:00Z"), TongTien: NumberDecimal("250000.00") }] },
{ MaGiaoDich: "GD0039", MaKhachHang: 39, TongHoaDon: NumberDecimal("1890000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-09-10T15:30:00Z"), TrangThai: "Đang xử lý", DSDatPhong: [{ MaPhong: 19, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("800000.00"), NgayNhan: ISODate("2025-09-05T14:00:00Z"), NgayTra: ISODate("2025-09-10T13:00:00Z"), TongTien: NumberDecimal("4000000.00") }] },
{ MaGiaoDich: "GD0040", MaKhachHang: 40, TongHoaDon: NumberDecimal("720000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-01-05T08:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 20, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("500000.00"), NgayNhan: ISODate("2025-01-03T07:00:00Z"), NgayTra: ISODate("2025-01-05T06:00:00Z"), TongTien: NumberDecimal("1000000.00") }] },
{ MaGiaoDich: "GD0041", MaKhachHang: 41, TongHoaDon: NumberDecimal("990000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2025-04-18T12:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 1, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("850000.00"), NgayNhan: ISODate("2025-04-14T11:00:00Z"), NgayTra: ISODate("2025-04-18T10:00:00Z"), TongTien: NumberDecimal("3400000.00") }] },
{ MaGiaoDich: "GD0042", MaKhachHang: 42, TongHoaDon: NumberDecimal("640000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2024-11-20T10:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 2, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("550000.00"), NgayNhan: ISODate("2024-11-18T09:00:00Z"), NgayTra: ISODate("2024-11-20T08:00:00Z"), TongTien: NumberDecimal("1100000.00") }] },
{ MaGiaoDich: "GD0043", MaKhachHang: 43, TongHoaDon: NumberDecimal("1850000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-06-30T11:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 3, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("1000000.00"), NgayNhan: ISODate("2025-06-25T10:00:00Z"), NgayTra: ISODate("2025-06-30T09:00:00Z"), TongTien: NumberDecimal("5000000.00") }] },
{ MaGiaoDich: "GD0044", MaKhachHang: 44, TongHoaDon: NumberDecimal("320000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2024-02-14T09:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 4, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("300000.00"), NgayNhan: ISODate("2024-02-13T08:00:00Z"), NgayTra: ISODate("2024-02-14T07:00:00Z"), TongTien: NumberDecimal("300000.00") }] },
{ MaGiaoDich: "GD0045", MaKhachHang: 45, TongHoaDon: NumberDecimal("2700000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-07-25T14:30:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 5, LoaiPhong: "Phòng cao cấp", GiaPhong: NumberDecimal("1200000.00"), NgayNhan: ISODate("2025-07-20T13:00:00Z"), NgayTra: ISODate("2025-07-25T12:00:00Z"), TongTien: NumberDecimal("7200000.00") }] },
{ MaGiaoDich: "GD0046", MaKhachHang: 46, TongHoaDon: NumberDecimal("530000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-03-01T07:20:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 6, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("450000.00"), NgayNhan: ISODate("2025-02-28T06:00:00Z"), NgayTra: ISODate("2025-03-01T05:00:00Z"), TongTien: NumberDecimal("450000.00") }] },
{ MaGiaoDich: "GD0047", MaKhachHang: 47, TongHoaDon: NumberDecimal("420000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2024-04-20T10:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 7, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("350000.00"), NgayNhan: ISODate("2024-04-19T09:00:00Z"), NgayTra: ISODate("2024-04-20T08:00:00Z"), TongTien: NumberDecimal("350000.00") }] },
{ MaGiaoDich: "GD0048", MaKhachHang: 48, TongHoaDon: NumberDecimal("1580000.00"), PTThanhToan: "Thẻ", NgayThanhToan: ISODate("2025-08-05T12:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 8, LoaiPhong: "Phòng đôi", GiaPhong: NumberDecimal("700000.00"), NgayNhan: ISODate("2025-08-01T11:00:00Z"), NgayTra: ISODate("2025-08-05T10:00:00Z"), TongTien: NumberDecimal("2800000.00") }] },
{ MaGiaoDich: "GD0049", MaKhachHang: 49, TongHoaDon: NumberDecimal("490000.00"), PTThanhToan: "Tiền mặt", NgayThanhToan: ISODate("2025-02-26T09:00:00Z"), TrangThai: "Hoàn tất", DSDatPhong: [{ MaPhong: 9, LoaiPhong: "Phòng tiêu chuẩn", GiaPhong: NumberDecimal("400000.00"), NgayNhan: ISODate("2025-02-24T08:00:00Z"), NgayTra: ISODate("2025-02-26T07:00:00Z"), TongTien: NumberDecimal("800000.00") }] },
{ MaGiaoDich: "GD0050", MaKhachHang: 50, TongHoaDon: NumberDecimal("210000.00"), PTThanhToan: "Chuyển khoản", NgayThanhToan: ISODate("2024-01-10T08:00:00Z"), TrangThai: "Hủy", DSDatPhong: [{ MaPhong: 10, LoaiPhong: "Phòng đơn", GiaPhong: NumberDecimal("250000.00"), NgayNhan: ISODate("2024-01-09T07:00:00Z"), NgayTra: ISODate("2024-01-10T06:00:00Z"), TongTien: NumberDecimal("250000.00") }] }
]);
db.DanhGia.insertMany([
  {
    "MaKhachHang": "KH0001",
    "MaPhong": "MP0001",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Phòng sạch, nhân viên thân thiện. Sẽ quay lại."
  },
  {
    "MaKhachHang": "KH0002",
    "MaPhong": "MP0002",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Vị trí tốt nhưng điều hòa yếu."
  },
  {
    "MaKhachHang": "KH0003",
    "MaPhong": "MP0003",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "View đẹp, bữa sáng ngon."
  },
  {
    "MaKhachHang": "KH0004",
    "MaPhong": "MP0004",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "kém",
    "NDDanhGia": "Phòng có mùi, yêu cầu dọn lại nhưng lâu không giải quyết."
  },
  {
    "MaKhachHang": "KH0005",
    "MaPhong": "MP0005",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Giá hợp lý, sạch sẽ."
  },
  {
    "MaKhachHang": "KH0006",
    "MaPhong": "MP0006",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Tiện nghi ok, nhưng wifi yếu."
  },
  {
    "MaKhachHang": "KH0007",
    "MaPhong": "MP0007",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Nhân viên phục vụ rất nhiệt tình."
  },
  {
    "MaKhachHang": "KH0008",
    "MaPhong": "MP0008",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Vị trí trung tâm, tiện đi lại."
  },
  {
    "MaKhachHang": "KH0009",
    "MaPhong": "MP0009",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "kém",
    "NDDanhGia": "Đặt bữa sáng nhưng không có, bực mình."
  },
  {
    "MaKhachHang": "KH0010",
    "MaPhong": "MP0010",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Ổn nhưng cần cải thiện cách âm."
  },
  {
    "MaKhachHang": "KH0011",
    "MaPhong": "MP0011",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Giá tốt vào dịp cuối tuần."
  },
  {
    "MaKhachHang": "KH0012",
    "MaPhong": "MP0012",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Sạch sẽ và dịch vụ chuyên nghiệp."
  },
  {
    "MaKhachHang": "KH0013",
    "MaPhong": "MP0013",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Thiếu ổ cắm gần giường."
  },
  {
    "MaKhachHang": "KH0014",
    "MaPhong": "MP0014",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Rộng rãi, phù hợp gia đình."
  },
  {
    "MaKhachHang": "KH0015",
    "MaPhong": "MP0015",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "kém",
    "NDDanhGia": "Phòng hơi cũ, cần bảo trì."
  },
  {
    "MaKhachHang": "KH0016",
    "MaPhong": "MP0016",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Giường êm, ngủ ngon."
  },
  {
    "MaKhachHang": "KH0017",
    "MaPhong": "MP0017",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Nhà vệ sinh sạch, nước nóng ổn."
  },
  {
    "MaKhachHang": "KH0018",
    "MaPhong": "MP0018",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Giá cao so với dịch vụ."
  },
  {
    "MaKhachHang": "KH0019",
    "MaPhong": "MP0019",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Có bữa sáng miễn phí, ngon."
  },
  {
    "MaKhachHang": "KH0020",
    "MaPhong": "MP0020",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Không gian yên tĩnh, phù hợp công tác."
  },
  {
    "MaKhachHang": "KH0021",
    "MaPhong": "MP0001",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Đẹp nhưng phục vụ chậm."
  },
  {
    "MaKhachHang": "KH0022",
    "MaPhong": "MP0002",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "kém",
    "NDDanhGia": "Gặp tiếng ồn suốt đêm."
  },
  {
    "MaKhachHang": "KH0023",
    "MaPhong": "MP0003",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Tiện ích đủ dùng, đáng tiền."
  },
  {
    "MaKhachHang": "KH0024",
    "MaPhong": "MP0004",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Rất hài lòng, sẽ giới thiệu bạn bè."
  },
  {
    "MaKhachHang": "KH0025",
    "MaPhong": "MP0005",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Bồn tắm hỏng, đã báo mà chưa sửa."
  },
  {
    "MaKhachHang": "KH0026",
    "MaPhong": "MP0006",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Nhân viên lễ tân thân thiện."
  },
  {
    "MaKhachHang": "KH0027",
    "MaPhong": "MP0007",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Không khí thoải mái, đáng tiền."
  },
  {
    "MaKhachHang": "KH0028",
    "MaPhong": "MP0008",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Muốn có thêm kệ để đồ."
  },
  {
    "MaKhachHang": "KH0029",
    "MaPhong": "MP0009",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "kém",
    "NDDanhGia": "Phòng không giống mô tả trên web."
  },
  {
    "MaKhachHang": "KH0030",
    "MaPhong": "MP0010",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Có dịch vụ đưa đón, rất thuận tiện."
  },
  {
    "MaKhachHang": "KH0031",
    "MaPhong": "MP0011",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Sạch sẽ, check-in nhanh."
  },
  {
    "MaKhachHang": "KH0032",
    "MaPhong": "MP0012",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Phòng hơi nhỏ so với ảnh."
  },
  {
    "MaKhachHang": "KH0033",
    "MaPhong": "MP0013",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Rất hài lòng với bữa sáng."
  },
  {
    "MaKhachHang": "KH0034",
    "MaPhong": "MP0014",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Giá trị tốt so với số tiền."
  },
  {
    "MaKhachHang": "KH0035",
    "MaPhong": "MP0015",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Đủ tiện nghi cho hai người."
  },
  {
    "MaKhachHang": "KH0036",
    "MaPhong": "MP0016",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Giường hơi mềm."
  },
  {
    "MaKhachHang": "KH0037",
    "MaPhong": "MP0017",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Tiền phòng hợp lý, sạch sẽ."
  },
  {
    "MaKhachHang": "KH0038",
    "MaPhong": "MP0018",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "kém",
    "NDDanhGia": "Không nhận được dịch vụ như cam kết."
  },
  {
    "MaKhachHang": "KH0039",
    "MaPhong": "MP0019",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Rất thoải mái, sẽ quay lại."
  },
  {
    "MaKhachHang": "KH0040",
    "MaPhong": "MP0020",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Cần thêm khăn tắm dự phòng."
  },
  {
    "MaKhachHang": "KH0041",
    "MaPhong": "MP0001",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Vị trí thuận tiện, giá tốt."
  },
  {
    "MaKhachHang": "KH0042",
    "MaPhong": "MP0002",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Nhân viên chu đáo, phòng đẹp."
  },
  {
    "MaKhachHang": "KH0043",
    "MaPhong": "MP0003",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Phòng hơi nhỏ, bù lại giá rẻ."
  },
  {
    "MaKhachHang": "KH0044",
    "MaPhong": "MP0004",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "kém",
    "NDDanhGia": "Có lỗi đặt phòng, thời gian check-in bị trễ."
  },
  {
    "MaKhachHang": "KH0045",
    "MaPhong": "MP0005",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Trải nghiệm tuyệt vời cho kỳ nghỉ."
  },
  {
    "MaKhachHang": "KH0046",
    "MaPhong": "MP0006",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Ổn nhưng chưa xuất sắc."
  },
  {
    "MaKhachHang": "KH0047",
    "MaPhong": "MP0007",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Thuận tiện, dễ di chuyển đến điểm tham quan."
  },
  {
    "MaKhachHang": "KH0048",
    "MaPhong": "MP0008",
    "LoaiPhong": "Suite",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Dịch vụ trọn gói tốt."
  },
  {
    "MaKhachHang": "KH0049",
    "MaPhong": "MP0009",
    "LoaiPhong": "Phòng đơn",
    "LoaiDanhGia": "tốt",
    "NDDanhGia": "Giá hợp lý, sạch sẽ."
  },
  {
    "MaKhachHang": "KH0050",
    "MaPhong": "MP0010",
    "LoaiPhong": "Phòng đôi",
    "LoaiDanhGia": "trung bình",
    "NDDanhGia": "Cần cải thiện wifi."
  }
])
//Tao index
db.LSGiaoDich.createIndex({ NgayThanhToan: 1 });
db.LSGiaoDich.createIndex({ PTThanhToan: 1, NgayThanhToan: 1 });
db.LSGiaoDich.createIndex({ MaKhachHang: 1, NgayThanhToan: -1 });
  

db.DanhGia.createIndex({ LoaiPhong: 1 });
db.DanhGia.createIndex({ LoaiDanhGia: 1 });
db.DanhGia.createIndex({ MaKhachHang: 1, LoaiDanhGia: -1 });








//aggregate

//Tính điểm trung bình đánh giá theo loại phòng
db.DanhGia.aggregate([
  {
    $group: {
      _id: "$LoaiPhong",
      DiemTrungBinh: {
        $avg: {
          $cond: [
            { $eq: ["$LoaiDanhGia", "tốt"] }, 5,
            { $cond: [
              { $eq: ["$LoaiDanhGia", "trung bình"] }, 3, 1
            ]}
          ]
        }
      }
    }
  }
])


// Thống kê số lượng đánh giá theo mức độ 
db.DanhGia.aggregate([
  { $group: { _id: "$LoaiDanhGia", SoLuong: { $sum: 1 } } }
])

//Đưa ra đánh giá theo loại    
db.DanhGia.aggregate([
  {
    $group: {
      _id: "$LoaiDanhGia",
      danhSach: {
        $push: {
          MaKhachHang: "$MaKhachHang",
          MaPhong: "$MaPhong",
          LoaiPhong: "$LoaiPhong",
          NDDanhGia: "$NDDanhGia"
        }
      }
    }
  }
])

//Tính tổng doanh thu 
db.LSGiaoDich.aggregate([
  {$match : {}},
  {$group : {
    _id : null,
    TongDoanhThu : {$sum : "$TongHoaDon"}
  }}
])

// Thống kê doanh thu theo phương thức thanh toán
db.HoaDon.aggregate([
  {
    $group: {
      _id: "$PhuongThuc",
      tongDoanhThu: { $sum: "$TongHoaDon" },
      soHoaDon: { $count: {} }
    }
  },
  {
    $project: {
      _id: 0,
      PhuongThuc: "$_id",
      tongDoanhThu: 1,
      soHoaDon: 1
    }
  }
])

//Thống kê doanh thu theo loại phòng
db.DatPhong.aggregate([
  {
    $lookup: {
      from: "HoaDon",
      localField: "MaHoaDon",
      foreignField: "_id",
      as: "hoaDon"
    }
  },
  { $unwind: "$hoaDon" },

  {
    $lookup: {
      from: "Phong",
      localField: "MaPhong",
      foreignField: "_id",
      as: "phong"
    }
  },
  { $unwind: "$phong" },

  {
    $group: {
      _id: "$phong.LoaiPhong",
      tongDoanhThu: { $sum: "$hoaDon.TongHoaDon" },
      soLanDat: { $count: {} }
    }
  },
  {
    $project: {
      _id: 0,
      LoaiPhong: "$_id",
      tongDoanhThu: 1,
      soLanDat: 1
    }
  }
])

//end









