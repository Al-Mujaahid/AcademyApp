class MenteeModel {
  int? id;
  String? first_name;
  String? last_name;

  MenteeModel(
  {
    this.id,
    this.first_name,
    this.last_name,
}

      );

  MenteeModel.fromJson(Map<String, dynamic> json)
      : first_name = json['mentee']['first_name'],
        id = json['mentee']['id'],
        last_name = json['mentee']['last_name'];
}
