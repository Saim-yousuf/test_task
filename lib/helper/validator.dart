class ValidatorHelper {
  static String? validator(
    String? value, {
    String validationText = "",
  }) {
    if (value == "") {
      return validationText;
    }
    return null;
  }

  static String? referalValidator(String? value) {
    if (value == "") {
      return "";
    } else if (value!.length != 6) {
      return "Enter Valid Referral Code";
    }
    return null;
  }

  static String? validatorDropdown(
    Object? value, {
    String validationText = "",
  }) {
    if (value == null) {
      return validationText;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter the email";
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      return ("Invalid email format");
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "";
    } else if (value.length < 8) {
      return ("Password Must be more than 8 characters");
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return ("Password should contain upper,lower,digit and Special character");
    }
    return null;
  }
}
