import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentor.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class CreateSchedule {
  static Future scheduleMeeting({scheduleDate, mentorId, menteeId, objective}) async {

    var data = {
      'mentor_id': mentorId,
      'mentee_id': menteeId,
      'schedule_date': scheduleDate,
      'objectives': objective,
    };

    return await ApiBasics.makePostRequest(CREATE_SCHEDULE, data, null);
  }
}
