


import 'package:coin_commerce/core/utils/validator.dart';

class ValidatorImpl extends Validator {
  @override
  Validation validateEmail(String email) {
    final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (regex.hasMatch(email)) {
      return const Validation(
        isValid: true,
        errorMessage: '',
      );
    }

    return const Validation(
      isValid: false,
      errorMessage: 'message_invalid_email',
    );
  }

  @override
  Validation validatePassword(String password) {
    if (password.isEmpty) {
      return const Validation(
        isValid: false,
        errorMessage: 'message_password_required_error',
      );
    }

    if (password.length < 8) {
      return const Validation(
        isValid: false,
        errorMessage: 'message_password_length_error',
      );
    }

    return const Validation(isValid: true, errorMessage: '');
  }

  @override
  Validation validateRequiredField(String value) {
    if (value.isNotEmpty) {
      return const Validation(isValid: true, errorMessage: '');
    }

    return const Validation(
      isValid: false,
      errorMessage: 'message_field_cannot_be_empty',
    );
  }

  @override
  Validation validatePhone(String phone) {
    if (phone.length < 9) {
      return const Validation(
        isValid: false,
        errorMessage: 'message_invalid_phone_number_format',
      );
    }

    if (num.tryParse(phone) == null) {
      return const Validation(
        isValid: false,
        errorMessage: 'message_invalid_phone_number_format',
      );
    }

    return const Validation(
      isValid: true,
      errorMessage: '',
    );
  }
}
