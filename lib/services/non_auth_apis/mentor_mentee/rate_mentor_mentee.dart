import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentor.dart';
import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/schedule/get_all_schedule.dart';
import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class RateMentorMenteeAction {
  static Future rateMentorMenteeAction({ratings,comments, mentorId}) async {
    //MentorDetail.schedule_id
    var data = {
      'ratings': ratings,
      'recipient_id': mentorId,
      'comments': comments,
      'schedule_id': MentorDetail.schedule_id
    };

    return ApiBasics.makePostRequest(RATE_MENTOR_MENTEE, data, null);
  }
}
