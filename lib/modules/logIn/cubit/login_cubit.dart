import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/onBoardingModel/login_model.dart';
import 'package:shop_app/modules/logIn/cubit/login_states.dart';
import 'package:shop_app/shared/network/dio_helper.dart';
import 'package:shop_app/modules/home_layout/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;

  void userLogin(@required email, @required password) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJason(value.data);
      // print('${loginModel.status}');
      // print('${loginModel.data.token}');
      // print('${loginModel.message}');
      // print('Value is ${value.data}');
      emit(LoginSuccessState(loginModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginErrorState(onError.toString()));
    });
  }

  bool isVisibale = true;
  IconData sufixiIcon = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isVisibale = !isVisibale;
    sufixiIcon =
        isVisibale ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordIconState());
  }
}
