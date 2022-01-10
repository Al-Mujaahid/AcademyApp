import 'package:bot_toast/bot_toast.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/get_schedule.dart';
import 'package:muslim_app/services/non_auth_apis/schedule_meeting/get_schedule.dart';
import 'package:muslim_app/src/base_provider.dart';

class GetScheduleProvider extends BaseProvider {
  List<GetScheduleModel> scheduleList = [];

  String _mentorId = '';
  String _menteeId = '';

  GetScheduleProvider({required String mentorId, required String menteeId}) {
    _menteeId = menteeId;
    _mentorId = mentorId;
    getSchedule();
  }
  void getSchedule() async {
    try {
      // BotToast.showLoading();
      setLoading = true;
      var scheduleResponse = await ScheduleActions.getSchedule(
        menteeId: _menteeId, mentorId: _mentorId
      );
      List schedules = List.from(scheduleResponse['data']);
      print('trying to get schedules');
      print(schedules);
      scheduleList =  schedules.map((json) => GetScheduleModel.fromJson(json)).toList();
      // Alerts.closeLoadingAlert();
      setLoading = false;
      notifyListeners();
    } catch (e) {
      print("ErrorMuslimAPP..... $e");
      // Alerts.closeLoadingAlert();
      setLoading = false;
      rethrow;
    }
  }
}
