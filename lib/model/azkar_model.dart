class AzkarData {
  String title;
  String description;
  String azkar_text;
  String azkar_translation;
  String azkar_transliteration;
  String course_of_study;
  String duration;
  String time;

  AzkarData({
    required this.title,
    required this.description,
    required this.azkar_text,
    required this.azkar_translation,
    required this.azkar_transliteration,
    required this.course_of_study,
    required this.duration,
    required this.time,
  });

  AzkarData.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        azkar_text = json['azkar_text'],
        azkar_translation = json['azkar_translation'],
        azkar_transliteration = json['class'],
        course_of_study = json['course_of_study'],
        duration = json['duration'],
        time = json['time'];

  // static formJson(json) {}

  //AzkarData.toJson()
}
