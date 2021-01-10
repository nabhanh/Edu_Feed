import 'package:education_feed/model/news.dart';
import 'package:education_feed/services/networking.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  final Networking networking;

  AppProvider({this.networking});

  bool isNewsLoading = true;
  List<News> news = [];

  void getAllNews() async {
    news = await networking.getEducationNews();
    news += await networking.getScienceNews();
    news += await networking.getEducationNews();
    isNewsLoading = false;
    notifyListeners();
  }
}
