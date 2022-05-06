import 'package:shop_app/models/onBoardingModel/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String error;
  LoginErrorState(this.error);
}

class ChangePasswordIconState extends LoginStates {}
