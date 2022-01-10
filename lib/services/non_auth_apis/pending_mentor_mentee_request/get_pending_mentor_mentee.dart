import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class PendingMentorMentee {
  static Future getPendingMentorRequest() {
    return ApiBasics.makeGetRequest(PENDING_MENTOR_REQUEST, null);
  }

  static Future getPendingMenteeRequest() {
    return ApiBasics.makeGetRequest(PENDING_MENTEE_REQUEST, null);
  }
}
