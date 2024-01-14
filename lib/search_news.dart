import 'dart:convert';

import 'package:http/http.dart';

class SearchNews {
  final String newsTitle;
  SearchNews({required this.newsTitle});

  Future<Map> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=$newsTitle&from=2023-11-21&sortBy=publishedAt&apiKey=2e4c98da10284b55a3c6014d1d59dc70";

    Response res = await get(Uri.parse(url));
    Map data = jsonDecode(res.body);
    return data;
  }
}
