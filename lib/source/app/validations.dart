class Validations {
  static bool isPhoneValid(String phone, String regex) {
    if (phone.isEmpty) return false;
    if (regex.isNotEmpty) {
      RegExp _regExp = RegExp(regex);
      return _regExp.hasMatch(phone);
    }
    return true;
  }

  static bool isNameValid(String name) {
    if (name.isEmpty) return false;
    final RegExp _nameRegExp = RegExp(
      r'^(?=.*[a-z])[A-Za-z ]{2,}$',
    );

    return _nameRegExp.hasMatch(name);
  }

  static bool isEmailValid(String email) {
    if (email.isEmpty) return false;

    final RegExp _emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return _emailRegExp.hasMatch(email);
  }
}
