import 'dart:async';

import 'package:e_commerce_app/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModeOutputs {
  final StreamController _userEmailController = StreamController<String>.broadcast();
  final StreamController _userPasswordController = StreamController<String>.broadcast();

  @override
  void dispose() {
    _userEmailController.close();
    _userEmailController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputUserEmail => _userEmailController.sink;

  @override
  Sink get inputUserPassword => _userPasswordController.sink;

  @override
  Stream<bool> get isUserEmailValid =>
      _userEmailController.stream.map((email) => _isEmailVaild(email));

  @override
  Stream<bool> get isUserPasswordValid => _userPasswordController.stream
      .map((password) => _isPasswordValid(password));

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setUserEmail(String email) {
    inputUserEmail.add(email);
  }

  @override
  setUserPassword(String password) {
    inputUserPassword.add(password);
  }

  bool _isEmailVaild(String email) {
    return email.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }
}

abstract class LoginViewModelInputs {
  // methods
  setUserEmail(String email);

  setUserPassword(String password);

  login();

  // sink
  Sink get inputUserEmail;
  Sink get inputUserPassword;
}

abstract class LoginViewModeOutputs {
  Stream<bool> get isUserEmailValid;

  Stream<bool> get isUserPasswordValid;
}
