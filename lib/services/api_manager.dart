import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_info_model.dart';

class ApiManager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel = null;

    try {
      var resposnse = await client.get(
          'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=fa2266bb6b764af8816b75d85ef70762');
      if (resposnse.statusCode == 200) {
        var jsonString = resposnse.body;
        var jsonMap = json.decode(jsonString);
        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (e) {
      print(e.toString());
      return newsModel;
    }

    return newsModel;
  }
}
