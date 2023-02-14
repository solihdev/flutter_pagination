import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pagination/data/models/my_order_model.dart';

const String BASE_URL = 'https://techcrunch.com';

class MyRepository {
  static Future<List<OrdersListItem>> getOrdersList(
      {required int perPage, required int page}) async {
    Dio dio = Dio();
    dio.options.headers["Accept"] = "application/json";

    final Response response = await dio
        .get('$BASE_URL/wp-json/wp/v2/posts?context=embed', queryParameters: {
      "per_page": perPage,
      "page": page,
    });

    debugPrint('page=$page&perPage=$perPage');
    debugPrint('${response.statusCode}');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<OrdersListItem> orders = (response.data as List)
          .map((data) => OrdersListItem.fromJson(data))
          .toList();
      return orders;
    } else {
      throw Exception();
    }
  }
}
