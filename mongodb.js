//tạo collections +  chen data  + index








//aggregate

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



