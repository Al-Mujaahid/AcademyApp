import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class PendingMentorMentee {
  static Future getPendingMentorMentee() {
    return ApiBasics.makeGetRequest(PENDING_MENTOR_MENTEE, null);
  }
}
