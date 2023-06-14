// ignore_for_file: file_names, camel_case_types, unnecessary_this, non_constant_identifier_names, prefer_typing_uninitialized_variables

class RucheModel {
  int? rucheId;
  String? reference;
  String? nb_cadre;
  String? new_position;
  String? old_position;
  String? rucheImage;
  int? userid;

  static var rucheid;



  RucheModel(
      {this.rucheId,
      this.reference,
      this.nb_cadre,
      this.new_position,
      this.old_position,
      this.rucheImage,
      this.userid});

  RucheModel.fromJson(Map<String, dynamic> json) {
    rucheId = json['ruche_id'];
    reference = json['reference'];
    nb_cadre = json['nb_cadre'];
    new_position = json['new_position'];
    old_position = json['old_position'];
    rucheImage = json['ruche_image'];
    userid = json['user_id '];
  }





}
