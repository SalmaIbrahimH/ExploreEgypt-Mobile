import 'package:dio/dio.dart';
import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/models/article.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

const String ar_url = 'https://explore-egypt-arabic-db.herokuapp.com';
const String en_url = 'https://explore-egypt-db.herokuapp.com';
String base_url;

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

  Future<List<Article>> getFactsArticles() async {
    List<Article> articles = [];
    Response response;
    Dio dio = new Dio();
    print('test before');
    if (await getCurrentLang() == 'en') {
      print(await getCurrentLang());
      base_url = '$en_url/Articles?name=Facts';
    } else {
      print(await getCurrentLang());
      base_url = '$ar_url/Articles?name=Facts';
    }
    response = await dio.get("$base_url");
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
    if (await getCurrentLang() == 'en') {
      print(await getCurrentLang());
      base_url = '$en_url/Articles?page=Culture';
    } else {
      print(await getCurrentLang());
      base_url = '$ar_url/Articles?page=Culture';
    }
    response = await dio.get("$base_url");
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
    if (await getCurrentLang() == 'en') {
      print(await getCurrentLang());
      base_url = '$en_url/Articles?name=History';
    } else {
      print(await getCurrentLang());
      base_url = '$ar_url/Articles?name=History';
    }
    response = await dio.get("$base_url");
    print('test after');
    var data = response.data;
    data.forEach((val) {
      articles.add(Article.fromJson(val));
    });
    return articles;
  }
}
