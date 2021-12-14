import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class AzkarAction {
  static Future getazkarAction() {
    return ApiBasics.makeGetRequest(GET_ALL_AZKAR, null);
  }
}
