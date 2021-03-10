import '../models/article.dart';
import 'package:dio/dio.dart';

class ArticleService {
  String url = "https://explore-egypt-db.herokuapp.com/ActivitiesArticles";

  Future<List<Article>> getArticles() async {
    List<Article> articles = new List();
    Response response;
    Dio dio = new Dio();
    response = await dio.get(url);
    var data = response.data;
    print(data);
    data.forEach((value) {
      articles.add(Article.fromJson(value));
    });
    
    return articles;
  }
}
