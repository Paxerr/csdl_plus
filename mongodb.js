//tạo collections + index


//Chèn data





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


//end

