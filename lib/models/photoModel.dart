// ignore_for_file: file_names, camel_case_types, unnecessary_this

class PhotoModel {
  int? photoId;
  String? photoDetail;
  String? photo;
  int? photoUser;

  PhotoModel(
      {this.photoId,
      this.photoDetail,
      this.photo,
      this.photoUser});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    photoId = json['photo_id'];
    photoDetail = json['photo_detail'];
    photo = json['photo_image'];
    photoUser = json['photo_user'];
  }






}
