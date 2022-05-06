import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/onBoardingModel/home_model.dart';
import 'package:shop_app/modules/home_layout/categories_screen.dart';
import 'package:shop_app/modules/home_layout/favorite_screen.dart';
import 'package:shop_app/modules/home_layout/cubit/home_states.dart';
import 'package:shop_app/modules/home_layout/home_screen.dart';
import 'package:shop_app/modules/home_layout/setting_screen.dart';
import 'package:shop_app/shared/network/dio_helper.dart';
import 'package:shop_app/modules/home_layout/end_points.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  static int count = 5;
  List<Widget> homeScreens = [
    HomeScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingScreen()
  ];
  int currentIndex = 0;

  void changeBottomSheetIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavigationBar());
  }

  HomeModel? homeModel;
  void getHomeDate() {
    emit(HomeLoadingState());
    DioHelper.getData(url: Home).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.state);
      emit(HomeGetSuccessState());
    }).catchError((onError) {
      print('error is:${onError.toString()}');
      emit(HomeGetErrorState());
    });
  }
}
