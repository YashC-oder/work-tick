import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_1707/views/EmployeeDetail/EmployeeDetail.dart';

final homeControllerProvider = ChangeNotifierProvider((ref) => Homecontroller());
class Homecontroller extends ChangeNotifier {
  int page = 0;

  List<Widget> pages = [
    const EmployeeDetail(),
  ];
  Widget get currentPage => pages[page];

  void updateCurrentPage(int page){
    this.page = page;
    notifyListeners();
  }
}