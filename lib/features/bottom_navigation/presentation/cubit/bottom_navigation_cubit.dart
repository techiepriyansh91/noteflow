import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../home_screen/presentation/views/home_page.dart';
import '../../../profile_screen/profile_page_screen.dart';
import '../../../setting/settings_screen.dart';


class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);
  final List<Widget> pages = [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  void changeTab(int index) {
    emit(index);
  }
}
