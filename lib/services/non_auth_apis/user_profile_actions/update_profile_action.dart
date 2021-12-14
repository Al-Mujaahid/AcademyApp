import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class UpdateProfileAction {
  static Future updateProfileAction(
      {phone,
      nick_name,
      branch,
      school,
      classs,
      course_of_study,
      qualification,
      no_of_children,
      social_media,
      skills,
      availability_status,
      marital_status,
      post,
      address,
      sex}) {
    var data = {
      "phone": phone,
      "nick_name": nick_name,
      "branch": branch,
      "school": school,
      "classs": classs,
      "course_of_study": course_of_study,
      "qualification": qualification,
      "no_of_children": no_of_children,
      "social_media": social_media,
      "skills": skills,
      "availability_status": availability_status,
      "marital_status": marital_status,
      "post": post,
      "address": address,
      "sex": sex
    };
    return ApiBasics.makePostRequest(UPDATE_USER_PROFILE, data, null);
  }
}
