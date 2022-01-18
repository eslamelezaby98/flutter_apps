import 'package:dartz/dartz.dart';
import 'package:note_app/domain/core/failures.dart';
import 'package:note_app/domain/core/value_objects.dart';
import 'package:note_app/domain/core/value_validation.dart';

class EmailAddress extends VlaueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const EmailAddress._({
    required this.value,
  });

  factory EmailAddress(String email) {
    return EmailAddress._(value: validationEmail(email));
  }

}

class Password extends VlaueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Password._({
    required this.value,
  });

  factory Password(String password) {
    return Password._(value: validationPassword(password));
  }

}



