import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/home_layout/cubit/home_cuibt.dart';
import 'package:shop_app/modules/home_layout/home_layout.dart';
import 'package:shop_app/modules/logIn/login.dart';
import 'package:shop_app/modules/onBoarding/on_Boarding.dart';
import 'package:shop_app/shared/network/dio_helper.dart';
import 'package:shop_app/shared/network/shared_prefernce.dart';
import 'package:shop_app/shared/style/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.inti();
  await SharedPreference.inti();
  String? token = SharedPreference.getData('token');
  bool? onBoarding = SharedPreference.getData('onBoarding');
  Widget widget;
  if (onBoarding != null) {
    if (token == null) {
      widget = LoginScreen();
    } else {
      widget = HomeLayout();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(widget));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Widget startingWidget;
  MyApp(this.startingWidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeDate(),
      child: MaterialApp(
        home: startingWidget,
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
