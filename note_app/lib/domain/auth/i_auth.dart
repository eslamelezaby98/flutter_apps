import 'package:dartz/dartz.dart';
import 'package:note_app/domain/auth/auth_failure.dart';

abstract class IAuth {
  Future<Either<AuthFailure,Unit>> registerWithEamilAndPAssword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure,Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure,Unit>> signInWithGoogle();
}
