import 'package:dartz/dartz.dart';
import 'package:note_app/domain/core/failures.dart';

Either<ValueFailure<String>, String> validationEmail(String email) {
  const String emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(email)) {
    return right(email);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: email));
  }
}

Either<ValueFailure<String>, String> validationPassword(String password) {
  if (password.length >= 6) {
    return right(password);
  } else {
    return left(ValueFailure.shortPassword(failedValue: password));
  }
}
