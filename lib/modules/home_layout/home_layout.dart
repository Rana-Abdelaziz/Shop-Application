import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/home_layout/cubit/home_cuibt.dart';
import 'package:shop_app/modules/home_layout/cubit/home_states.dart';
import 'package:shop_app/modules/home_layout/search_screen.dart';
import 'package:shop_app/modules/logIn/login.dart';
import 'package:shop_app/shared/network/shared_prefernce.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('SALLA'), actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
                icon: Icon(Icons.search))
          ]),
          body: homeCubit.homeScreens[homeCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              homeCubit.changeBottomSheetIndex(index);
            },
            currentIndex: homeCubit.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
// TextButton(
// child: Text('SignOut'),
// onPressed: () {
// SharedPreference.putData('token', '').then((value) {
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(builder: (context) => LoginScreen()),
// (route) => false);
// });
// },
// )
