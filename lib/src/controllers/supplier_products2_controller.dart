import 'dart:convert';
import '../models/supplier_product2_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const String url =
    "http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/european_provider";

List<Product2> parseProduct(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var products = list.map((e) => Product2.fromJson(e)).toList();

  return products;
}

Future<List<Product2>> fetchProducts() async {
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseProduct, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
