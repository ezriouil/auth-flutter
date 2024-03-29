class Validator {
  Validator._();

  static String? validateEmptyField(String fieldName, String? value) {
    if (value == null || value.isEmpty || value.length<4) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateEmailField(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address";
    }

    return null;
  }

  static String? validatePasswordField(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length <= 5) {
      return "password must have 6 (char / num) or more";
    }

    return null;
  }

}
