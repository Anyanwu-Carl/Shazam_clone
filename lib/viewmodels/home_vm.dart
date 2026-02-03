import 'package:flutter/material.dart';
import 'package:hooks_riverpod/legacy.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel();
}

final homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});
