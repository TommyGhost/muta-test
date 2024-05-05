import 'package:babelos_app/presentation/screen/home/home_ui.dart';
import 'package:flutter/material.dart';
import '../../base/base.vm.dart';

class BottomNavViewModel extends BaseViewModel {

  List children = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
  ];
}
