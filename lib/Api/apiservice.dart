import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/product.dart';

class ApiService {
  static const String apiUrl = 'https://fakestoreapi.com/products';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products.');
    }
  }
}
