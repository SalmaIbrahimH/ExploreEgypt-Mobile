import 'package:explore_egypt/localization/localization_constants.dart';

import '../models/activitiesArticle.dart';
import 'package:dio/dio.dart';

const String ar_url = 'https://explore-egypt-arabic-db.herokuapp.com';
const String en_url = 'https://explore-egypt-db.herokuapp.com';
String base_url;

class ArticleService {
  Future<List<ActivitiesArticle>> getArticles() async {
    // ignore: deprecated_member_use
    List<ActivitiesArticle> articles = new List();
    Response response;
    // String base_url;
    if (await getCurrentLang() == 'en') {
      print(await getCurrentLang());
      base_url = '$en_url/activitiesArticles';
    } else {
      print(await getCurrentLang());
      base_url = '$ar_url/activitiesArticles';
    }
    Dio dio = new Dio();
    response = await dio.get(base_url);
    var data = response.data;
    print(data);
    data.forEach((value) {
      articles.add(ActivitiesArticle.fromJson(value));
    });

    return articles;
  }
}
