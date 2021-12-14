import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class GetUserProfile{
  static getProfile() async {
    return await ApiBasics.makeGetRequest(GET_USER_PROFILE, null);
  }
}

