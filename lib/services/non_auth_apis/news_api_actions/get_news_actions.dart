import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class NewsAPIS {
  static Future getNews() {
    return ApiBasics.makeGetRequest(GET_NEWS, null);
  }
}
