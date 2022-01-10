import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class ScheduleActions {
  static Future getSchedule({required String mentorId, required String menteeId}) {
    return ApiBasics.makeGetRequest(GET_SCHEDULE+'/$mentorId/$menteeId', null);
  }
}
