// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String apiUrl = "https://fakestoreapi.com/products";

  Future<List<Map<String, dynamic>>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Map<String, dynamic>>> getProductsDetail(idProduk) async {
    final response = await http.get(Uri.parse('$apiUrl/' + idProduk));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
