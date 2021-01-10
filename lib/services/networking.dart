import 'dart:convert';

import 'package:education_feed/model/news.dart';
import 'package:http/http.dart';

class Networking {
  String _apiKey = '91c21333ccb84a6892f4fe6ba21fe8b3';

  String _url = 'http://newsapi.org/v2/everything';

  Future<List<News>> getScienceNews() async {
    Response response = await get('$_url?q=science&apiKey=$_apiKey');
    List<News> news = [];
    if (response.statusCode == 200) {
      String body = response.body;
      dynamic data = jsonDecode(body);
      
      for (var article in data['articles']) {
        news.add(News.fromJson(article));
      }
      print(news);
    }
    return news;
  }
  Future<List<News>> getTechNews() async {
    Response response = await get('$_url?q=technology&apiKey=$_apiKey');
    List<News> news = [];
    if (response.statusCode == 200) {
      String body = response.body;
      dynamic data = jsonDecode(body);
      
      for (var article in data['articles']) {
        news.add(News.fromJson(article));
      }
      print(news);
    }
    return news;
  }

  Future<List<News>> getEducationNews() async {
    Response response = await get('$_url?q=education&apiKey=$_apiKey');
    List<News> news = [];
    if (response.statusCode == 200) {
      String body = response.body;
      dynamic data = jsonDecode(body);
      
      for (var article in data['articles']) {
        news.add(News.fromJson(article));
      }
      print(news);
    }
    return news;
  }
}
