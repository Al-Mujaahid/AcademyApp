class NewsModel {
  String title;
  String description;
  String media_type;
  String media_file;
  String targeted_users;

  NewsModel(
    this.title,
    this.description,
    this.media_type,
    this.media_file,
    this.targeted_users,
  );

  NewsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        media_type = json['media_type'],
        media_file = json['media_file'],
        targeted_users = json['targeted_users'];
}
