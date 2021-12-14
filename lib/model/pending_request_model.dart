class PendingRequestModel {
  int id;
  int mentor_id;
  int mentee_id;
  String mentor_status;
  String mentor_comment;
  String mentor_first_name;
  String mentor_last_name;
  String mentor_phone_number;
  String mentor_email;
  String mentee_status;
  String mentee_comment;
  String mentee_first_name;
  String mentee_last_name;
  String mentee_phone_number;
  String mentee_email;




  PendingRequestModel(
      this.id,
      this.mentor_id,
      this.mentee_id,
      this.mentor_status,
      this.mentor_comment,
      this.mentor_first_name,
      this.mentor_last_name,
      this.mentor_phone_number,
      this.mentor_email,
      this.mentee_status,
      this.mentee_comment,
      this.mentee_first_name,
      this.mentee_last_name,
      this.mentee_phone_number,
      this.mentee_email,
      );

  PendingRequestModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mentor_status = json['mentor_status'] ?? 'pending...',
        mentor_comment = json['mentor_comment'] ?? 'NIL',
        mentor_id = json['mentor_id'] ?? 'mentor_id',
        mentor_first_name = json['mentor']['first_name'] ?? 'No first name',
        mentor_last_name = json['mentor']['last_name'] ?? 'No last name',
        mentor_phone_number = json['mentor']['phone_number'] ?? 'NIL',
        mentor_email = json['mentor']['email'] ?? 'NIL',
        mentee_id = json['mentor_id'] ?? 'mentee_id',
        mentee_status = json['mentee_status'] ?? 'pending',
        mentee_comment = json['mentee_comment'] ?? 'NIL',
        mentee_first_name = json['mentee']['first_name'] ?? 'No first name',
        mentee_last_name = json['mentee']['last_name'] ?? 'No last name',
        mentee_phone_number = json['mentee']['phone_number'] ?? 'NIL',
        mentee_email = json['mentee']['email'] ?? 'NIL';

}
