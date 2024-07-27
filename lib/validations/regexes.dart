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
    } else if (value.length < 5 || value.length > 50) {
      return 'Email must be between 5 and 50 characters';
    } else if (!RegExes.validateEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? userNameValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 3 || value.length > 15) {
      return 'Username must be between 3 and 15 characters';
    } else if (!RegExes.validateUsername(value)) {
      return 'Invalid username format';
    }
    return null;
  }

  String? phoneValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length != 10) {
      return 'Phone number must be exactly 10 digits';
    } else if (!RegExes.validatePhone(value)) {
      return 'Invalid phone number format';
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 8 || value.length > 20) {
      return 'Password must be between 8 and 20 characters';
    } else if (!RegExes.validatePassword(value)) {
      return 'Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character';
    }
    return null;
  }
}
