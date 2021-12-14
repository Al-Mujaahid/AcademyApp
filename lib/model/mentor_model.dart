class MentorModel {
  int? id;
  String? first_name;
  String? last_name;

  MentorModel(
  {
    this.id,
    this.first_name,
    this.last_name,
});

  MentorModel.fromJson(Map<String, dynamic> json)
      : first_name = json['mentor']['first_name'],
        id = json['mentor']['id'],
        last_name = json['mentor']['last_name'];
}
