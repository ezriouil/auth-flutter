import 'package:flutter_node_js/utils/constants/custom_api.dart';
import 'package:flutter_node_js/utils/http/http_client.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthRepository {
  AuthRepository._();

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<http.Response> signUp({required String userName, required String email, required String password}) async {
    final http.Response result = await Http.post(
        endPoint: CustomApi.SIGN_UP,
        body: {
          'userName': userName,
          'email': email,
          'password': password
        });
    return result;
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<http.Response> login({required String email, required String password}) async {
    final http.Response result = await Http.post(
        endPoint: CustomApi.LOGIN,
        body: {
          'email': email,
          'password': password
        });
    return result;
  }

  // - - - - - - - - - - - - - - - - - - SEND OTP CODE INTO EMAIL USER FOR RESET THE PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<http.Response> sendOTPCodeResetThePassword({required String email}) async {
    final http.Response result = await Http.post(
        endPoint: CustomApi.SEND_OTP_CODE_RESET_THE_PASSWORD,
        body: {
          'email': email
        });
    return result;
  }

  // - - - - - - - - - - - - - - - - - - VERIFY OTP CODE FROM EMAIL USER FOR RESET THE PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<http.Response> verifyOTPCodeResetThePassword({required String email, required String code}) async {
    final http.Response result = await Http.post(
        endPoint: CustomApi.VERIFY_OTP_CODE_RESET_THE_PASSWORD,
        body: {
          'email': email,
          'code' : code
        });
    return result;
  }

  // - - - - - - - - - - - - - - - - - - RESET THE PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<http.Response> resetThePassword({required String email, required String newPassword}) async {
    final http.Response result = await Http.put(
          endPoint: CustomApi.RESET_THE_PASSWORD,
        body: {
          'email': email,
          'newPassword' : newPassword
        });
    return result;
  }

  // - - - - - - - - - - - - - - - - - - RESET THE PASSWORD - - - - - - - - - - - - - - - - - -  //
  static Future<http.Response> reSentEmailVerificationLink({required String email}) async {
    final http.Response result = await Http.put(
          endPoint: CustomApi.RE_SEND_EMAIL_VERIFICATION_LINK,
        body: {
          'email': email,
        });
    return result;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE USER INFO - - - - - - - - - - - - - - - - - -  //
  static Future<http.Response> updateUserInfo({required String id ,required String userName, required String password, required String token}) async {
    final http.Response result = await Http.put(
        endPoint: "${CustomApi.UPDATE_USER_INFO}/$id",
        headers: {
          "token" : token,
          "Content-Type": "application/json ; charset=UTF-8"
        },
        body: {
          'userName' : userName,
          'password' : password,
        });
    return result;
  }
}
