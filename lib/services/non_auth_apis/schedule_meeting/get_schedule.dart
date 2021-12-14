import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class ScheduleActions {
  static Future getSchedule() {
    return ApiBasics.makeGetRequest(GET_SCHEDULE, null);
  }
}
