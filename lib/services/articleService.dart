import '../models/activitiesArticle.dart';
import 'package:dio/dio.dart';

class ArticleService {
  String url = "https://explore-egypt-db.herokuapp.com/ActivitiesArticles";

  Future<List<ActivitiesArticle>> getArticles() async {
    // ignore: deprecated_member_use
    List<ActivitiesArticle> articles = new List();
    Response response;
    Dio dio = new Dio();
    response = await dio.get(url);
    var data = response.data;
    print(data);
    data.forEach((value) {
      articles.add(ActivitiesArticle.fromJson(value));
    });
    
    return articles;
  }
}
