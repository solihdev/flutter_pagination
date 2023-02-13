import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pagination/data/models/my_order_model.dart';

const String BASE_URL = 'https://tenders.guru/api';

class MyRepository {
  static Future<List<OrdersListItem>> getOrdersList(int size, int page) async {
    Dio dio = Dio();
    dio.options.headers["Accept"] = "application/json";

    final Response response = await dio
        .get('$BASE_URL/pl/tenders', queryParameters: {
      "page": page,
      "size": size,
    });

    debugPrint('page=$page&size=$size');
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