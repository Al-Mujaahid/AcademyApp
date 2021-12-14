class GetScheduleModel {
  int? id;
  int? mentor_id;
  int? mentee_id;
  String? objectives;
  String? mentor_report;
  String? mentee_report;
  String? mentee_ratings;
  int? mentor_ratings;
  String? mentor_comment;
  String? mentee_comment;
  String? status;
  String? schedule_date;
  String? mentor;




  GetScheduleModel(
      {
        this.id,
        this.mentor_id,
        this.mentee_id,
        this.objectives,
        this.mentor_report,
        this.mentee_report,
        this.mentee_ratings,
        this.mentor_ratings,
        this.mentor_comment,
        this.mentee_comment,
        this.status,
        this.schedule_date,
        this.mentor,
      }
      );

  GetScheduleModel.fromJson(Map<String, dynamic> json){
    id = json['id']?? 'id';
    mentor_id = json['mentor_id'] ?? 'mentor_id';
    mentee_id = json['mentee_id'] ?? 'mentee_id';
    objectives = json['objectives'] ?? 'Goal setting';
    mentor_report = json['mentor_report'] ?? 'Nice meeting (Default REPORT)';
    mentee_report = json['mentee_report'] ?? 'Nice meeting (Default REPORT)';
    mentee_ratings = json['mentee_ratings']?? 'Rate mentor 5 stars (Default RATING)';
    mentor_ratings = json['mentor_ratings'] ;
    status = json['status']?? 'STARTED/CONCLUDED/PENDING';
    schedule_date = json['schedule_date']?? 'NIL';
    mentor = json['mentor']?? 'NIL';
    mentor_comment = json['mentor_comment']?? 'I am ok with the session i had';
    mentee_comment = json['mentee_comment']?? 'I am ok with the session i had';
  }
}

const IMAGE = 'https://bestprofilepictures.com/wp-content/uploads/2021/04/Cool-Profile-Picture-986x1024.jpg';