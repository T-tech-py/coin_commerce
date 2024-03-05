abstract class Validator {
  Validation validateEmail(String email);

  Validation validatePassword(String password);

  Validation validateRequiredField(String value);

  Validation validatePhone(String phone);
}

class Validation {
  final bool isValid;
  final String errorMessage;

  const Validation({
    required this.isValid,
    required this.errorMessage,
  });
}
