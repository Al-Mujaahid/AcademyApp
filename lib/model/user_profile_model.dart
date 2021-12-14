class UserProfileModel {
  int? user_id;
  String? first_name;
  String?  last_name;
  String?  phone_number;
  String?  email;
  String?  user_type;
  String?  image_url;
  String?  nick_name;
  String?  branch;
  String?  school;
  String?  classs;
  String?  course_of_stydy;
  String?  qualification;
  String?  no_of_mentor;
  String?  no_of_mentee;
  String?  social_media;
  String?  skills;
  String?  spiritual_level;
  String?  availability_status;
  String?  marital_status;
  int?  no_of_children;
  String?  post;
  String?  address;
  String?  sex;



  UserProfileModel(
  {
    this.user_id,
    this.first_name,
    this.last_name,
    this.phone_number,
    this.email,
    this.user_type,
    this.image_url,
    this.nick_name,
    this.branch,
    this.school,
    this.classs,
    this.course_of_stydy,
    this.qualification,
    this.no_of_mentor,
    this.no_of_mentee,
    this.social_media,
    this.skills,
    this.spiritual_level,
    this.availability_status,
    this.marital_status,
    this.no_of_children,
    this.post,
    this.address,
    this.sex
}
      );

  UserProfileModel.fromJson(Map<String, dynamic> json){
    user_id = json['id']?? 'id';
    first_name = json['first_name'] ?? 'NIL';
    last_name = json['last_name'] ?? 'NIL';
    phone_number = json['phone_number'] ?? 'NIL';
    email = json['email'] ?? 'NIL';
    user_type = json['user_type'] ?? 'NIL';
    image_url = json['profile']['image_url'] ?? IMAGE;
    nick_name = json['profile']['nick_name'] ?? 'NIL';
    branch = json['profile']['branch'] ?? 'NIL';
    school = json['profile']['school'] ?? 'NIL';
    classs = json['profile']['class'] ?? 'NIL';
    course_of_stydy = json['profile']['course_of_study'] ?? 'NIL';
    qualification = json['profile']['qualification'] ?? 'NIL';
    no_of_mentor = json['profile']['no_of_mentor'] ?? 'NIL';
    no_of_mentee = json['profile']['no_of_mentee'] ?? 'NIL';
    social_media = json['profile']['social_media'] ?? 'NIL';
    skills = json['profile']['skills'] ?? 'NIL';
    spiritual_level = json['profile']['spiritual_level'] ?? 'NIL';
    availability_status = json['profile']['availability_status'] ?? 'NIL';
    marital_status = json['profile']['marital_status'] ?? 'NIL';
    no_of_children = json['profile']['no_of_children'] ?? 'NIL';
    post = json['profile']['post'] ?? 'NIL';
    address = json['profile']['address'] ?? 'NIL';
    sex = json['profile']['sex'] ?? 'NIL';
  }
}

const IMAGE = 'https://bestprofilepictures.com/wp-content/uploads/2021/04/Cool-Profile-Picture-986x1024.jpg';