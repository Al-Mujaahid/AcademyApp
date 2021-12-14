import 'package:muslim_app/services/api_basics/ApiBasics.dart';
import 'package:muslim_app/utils/endpoints.dart';

class AuthBasics {
  static Future login({email, password}) async {
    var data = {"email": email, "password": password};
    // ignore: unnecessary_statements
    return ApiBasics.makePostRequest(LOGIN_URL, data, null);
  }

  static Future register(
      {email,
      password,
      confirm_password,
      first_name,
      last_name,
      phone_number}) async {
    var data = {
      "email": email,
      "password": password,
      "password_confirmation": confirm_password,
      "first_name": first_name,
      "phone_number": phone_number,
      "last_name": last_name,
      "user_type": "ADMIN"
    };
    // ignore: unnecessary_statements
    return ApiBasics.makePostRequest(REGISTER_URL, data, null);
  }

  static Future verifyEmail({
    email,
    code,
  }) {
    var data = {"email": email, "code": code};
    return ApiBasics.makePostRequest(VERIFY_EMAIL, data, null);
  }

  static Future forgotPassword({email}) {
    var data = {"email": email};
    return ApiBasics.makePostRequest(FORGOT_PASSWORD, data, null);
  }

  static Future resetPassword({email, code, password}) {
    var data = {"email": email, "code": code, "password": password};
    return ApiBasics.makePostRequest(RESET_PASSWORD, data, null);
  }

  static Future resendOTP({email}) {
    var data = {"email": email};
    return ApiBasics.makePostRequest(RESEND_OTP, data, null);
  }
}
