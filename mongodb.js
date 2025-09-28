//tạo collections +  chen data  + index








//aggregate

//Tính điểm trung bình đánh giá theo loại phòng
db.DanhGia.aggregate([
  {
    $group: {
      _id: "$LoaiPhong",
      DiemTrungBinh: { $avg: "$Diem" }
    }
  }
])

// Thống kê số lượng đánh giá theo mức độ 
db.DanhGia.aggregate([
  {
    $bucket: {
      groupBy: "$Diem",
      boundaries: [0, 2, 4, 6],   
      output: { SoLuong: { $sum: 1 } }
    }
  }
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

//end




