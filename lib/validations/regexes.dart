class RegExes {
  static const String _username = '^[a-zA-Z0-9_]{3,20}\$';

  static const String _email =
      '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$';

  static const String _phone =
      '^(\\(\\d{3}\\)|\\d{3})[-\\s.]?\\d{3}[-\\s.]?\\d{4}\$';

  static const String _password =
      '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$';

  static bool validateUsername(String username) =>
      RegExp(_username).hasMatch(username);

  static bool validateEmail(String email) => RegExp(_email).hasMatch(email);

  static bool validatePhone(String phone) => RegExp(_phone).hasMatch(phone);

  static bool validatePassword(String password) =>
      RegExp(_password).hasMatch(password);
}

class ValidationRules {
  String? emailValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (RegExes.validateEmail(value)) {
      return 'Email';
    }
    return null;
  }

  String? userNameValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (RegExes.validateUsername(value)) {
      return 'username';
    }
    return null;
  }

  String? phoneValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (RegExes.validatePhone(value)) {
      return 'phone';
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (RegExes.validatePassword(value)) {
      return 'password';
    }
    return null;
  }
}
