import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class ScheduleService {

  static Future commentOnSchedule({required String recipientId, required String comment, required int rating, required int scheduleId}) {
    return ApiBasics.makePostRequest(RATE_MENTOR_MENTEE, {
      "ratings": rating,
      "recipient_id": 2,
      "comments": comment,
      "schedule_id": scheduleId
    }, null);
  }


  static Future submitReportOnSchedule({required String recipientId, required String report, required int scheduleId}) {
    return ApiBasics.makePostRequest(RATE_MENTOR_MENTEE, {
      "recipient_id": recipientId,
      "report": report,
      "schedule_id": scheduleId
    }, null);
  }

}