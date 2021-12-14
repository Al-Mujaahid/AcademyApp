import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class MenteeList {
  static Future getMentees() {
    return ApiBasics.makeGetRequest(GET_MENTEES, null);
  }
}
