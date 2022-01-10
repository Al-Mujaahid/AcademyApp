import 'package:muslim_app/Screens/none_auth_screens/mentor_mentee_screen/pending_mentor_request.dart';
import 'package:muslim_app/Screens/none_auth_screens/user_profile_screen/user_profile_page.dart';
import 'package:muslim_app/providers/none_auth_provoders/pending_request_provider/get_pending_request_provider.dart';
import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class AcceptOrDeclineRequest {
  GetPendingRequestsProvider prv = GetPendingRequestsProvider();
  static get id => PendingRequestPage.user_id;
  static get one_user_id => UserProfile.one_user_id;
  static get recipient_ids => PendingRequestPage.recipient_id;
  static Future acceptOrDeclineRequest({status, comment, recipient_id,}) {
    var data = {'status': status, 'id': id, 'comment': comment, 'recipient_id': recipient_id,};
    return ApiBasics.makePostRequest(ACCEPT_OR_DECLINE_REQUEST, data, null);

  }
}
