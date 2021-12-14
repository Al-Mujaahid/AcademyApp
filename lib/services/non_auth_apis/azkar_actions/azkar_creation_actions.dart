import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class AzkarCreationAction {
  static Future azkarCreationAction(
      {title,
      discription,
      azkar_text,
      azkar_translation,
      azkar_transliteration,
      duration,
      time}) async {
    var data = {
      'title': title,
      'discription': discription,
      'azkar_text': azkar_text,
      'azkar_translation': azkar_translation,
      'azkar_transliteration': azkar_transliteration,
      'duration': duration,
      'time': time
    };

    return ApiBasics.makePostRequest(CREATE_AZKAR, data, null);
  }
}
