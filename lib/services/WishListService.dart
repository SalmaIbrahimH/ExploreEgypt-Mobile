import 'package:dio/dio.dart';
import 'package:explore_egypt/models/wishList.dart';

class WishListService {
  String url = "https://explore-egypt-db.herokuapp.com/wishlist?AricalTitle";
  Future<bool> isFav(id, userId, articalTitle) async {
    List<WishList> wishlist = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$url=$articalTitle");
    var data = response.data;
    data.forEach((value) {
      wishlist.add(WishList.fromJson(value));
    });
    var toggleFav =
        wishlist.where((element) => element.id == id && element.uId == userId);
    if (toggleFav.length >= 1) {
      return true;
    } else {
      return false;
    }
  }
}
