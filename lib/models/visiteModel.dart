// ignore_for_file: file_names, camel_case_types, unnecessary_this

class VisiteModel {
  int? visiteId;
  String? title;
  String? content;
  String? date;
  String? rucheid;
  int? imagename;

  VisiteModel(
      {this.visiteId,
      this.title,
      this.content,
      this.date,
      this.rucheid,
      this.imagename});

  VisiteModel.fromJson(Map<String, dynamic> json) {
    visiteId = json['visite_id'];
    title = json['visite_title'];
    content = json['visite_content'];
    date = json['visite_date'];
    rucheid = json['visite_ruche'];
    imagename = json['visite_image'];
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
