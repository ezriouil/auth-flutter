class CustomApi {
  CustomApi._();

  // - - - - - - - - - - - - - - - - - - BASE URL  - - - - - - - - - - - - - - - - - -  //
  static String BASE_URL = "*****************";

  // - - - - - - - - - - - - - - - - - - END POINTS  - - - - - - - - - - - - - - - - - -  //
  static String SIGN_UP = "/auth/register";
  static String RE_SEND_EMAIL_VERIFICATION_LINK = "/re-send-email-verification-link'";
  static String LOGIN = "/auth/login";
  static String SEND_OTP_CODE_RESET_THE_PASSWORD = "/auth/send-otp-code-reset-the-password";
  static String VERIFY_OTP_CODE_RESET_THE_PASSWORD = "/auth/verify-otp-code-reset-the-password";
  static String RESET_THE_PASSWORD = "/auth/reset-the-password";
  static String UPDATE_USER_INFO = "/users";
}