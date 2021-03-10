import 'package:dio/dio.dart';
import 'package:explore_egypt/models/article.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

const String url = 'https://explore-egypt-db.herokuapp.com';

class ExploreArticle {
  // Future getFactsArticles() async {
  //   print('test from service 1');
  //   http.Response response =
  //       await http.get(Uri.parse('$url/Articles?name=Facts'));

  //   print(response.statusCode);

  //   if (response.statusCode == 200) {
  //     print('test from service');
  //     String data = response.body;
  //     print(jsonDecode(data));
  //     return jsonDecode(data);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  // Future getCultureArticles() async {
  //   http.Response response =
  //       await http.get(Uri.parse('$url/Articles?page=Culture'));

  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     return jsonDecode(data);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  // Future getHistoryArticles() async {
  //   http.Response response =
  //       await http.get(Uri.parse('$url/Articles?name=History'));

  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     return jsonDecode(data);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  Future<List<Article>> getFactsArticles() async {
    List<Article> articles = [];
    Response response;
    Dio dio = new Dio();
    print('test before');
    response = await dio.get("$url/Articles?name=Facts");
    print('test after');
    var data = response.data;
    data.forEach((val) {
      articles.add(Article.fromJson(val));
    });
    return articles;
  }

  Future<List<Article>> getCultureArticles() async {
    List<Article> articles = [];
    Response response;
    Dio dio = new Dio();
    print('test before');
    response = await dio.get("$url/Articles?page=Culture");
    print('test after');
    var data = response.data;
    data.forEach((val) {
      articles.add(Article.fromJson(val));
    });
    return articles;
  }

  Future<List<Article>> getHistoryArticles() async {
    List<Article> articles = [];
    Response response;
    Dio dio = new Dio();
    print('test before');
    response = await dio.get("$url/Articles?name=History");
    print('test after');
    var data = response.data;
    data.forEach((val) {
      articles.add(Article.fromJson(val));
    });
    return articles;
  }
}
