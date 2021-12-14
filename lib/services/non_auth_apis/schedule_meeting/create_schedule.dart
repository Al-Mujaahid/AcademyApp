import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/mentor.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class CreateSchedule {
  static Future scheduleMeeting({schedule_date}) async {
    //int? mentee_id;
    // int? mentor_id;
    // int? recipient_id;
    // if (MentorListPage.mentor_id_of_mentor == UserProfile.one_user_id){
    //   CreateSchedule.mentor_id == UserProfile.one_user_id;
    // }else if (MentorListPage.mentor_id_of_mentor != UserProfile.one_user_id){
    //   CreateSchedule.mentee_id == UserProfile.one_user_id;
    //   CreateSchedule.recipient_id == UserProfile.one_user_id;
    // }
    // else if(Mentee.mentee_id_of_all_mentee == UserProfile.one_user_id){
    //   CreateSchedule.mentee_id == UserProfile.one_user_id;
    // }
    // else if(Mentee.mentee_id_of_all_mentee != UserProfile.one_user_id){
    //   CreateSchedule.mentor_id == UserProfile.one_user_id;
    //   CreateSchedule.recipient_id == UserProfile.one_user_id;
    // }
    // else{
    //   CreateSchedule.mentee_id == CreateSchedule.mentor_id;
    // }

    var data = {
      'mentor_id': MentorListPage.mentor_id_of_mentor ,
      'mentee_id': UserProfile.one_user_id,
      'schedule_date': schedule_date,
      'recipient_id': MentorListPage.mentor_id_of_mentor,
    };

    return await ApiBasics.makePostRequest(CREATE_SCHEDULE, data, null);
  }
}
