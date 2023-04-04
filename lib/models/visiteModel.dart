// ignore_for_file: file_names, camel_case_types, unnecessary_this

class VisiteModel {
  int? visiteId;
  String? visiteTitle;
  String? visiteContent;
  String? visiteDate;
  String? visiteImage;
  int? visiteUser;

  VisiteModel(
      {this.visiteId,
      this.visiteTitle,
      this.visiteContent,
      this.visiteDate,
      this.visiteImage,
      this.visiteUser});

  VisiteModel.fromJson(Map<String, dynamic> json) {
    visiteId = json['visite_id'];
    visiteTitle = json['visite_title'];
    visiteContent = json['visite_content'];
    visiteDate = json['visite_date'];
    visiteImage = json['visite_image'];
    visiteUser = json['visite_user'];
  }


//change object to json

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['visite_id'] = this.visiteId;
  //   data['visite_title'] = this.visiteTitle;
  //   data['visite_content'] = this.visiteContent;
  //   data['visite_date'] = this.visiteDate;
  //   data['visite_image'] = this.visiteImage;
  //   data['visite_user'] = this.visiteUser;
  //   return data;
  // }


}
