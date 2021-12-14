import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class MentorList {
  static Future getMentors() {
    return ApiBasics.makeGetRequest(GET_MENTOR, null);
  }
}
