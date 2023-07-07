import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecommerce/Api/apiservice.dart';
import 'package:ecommerce/Model/product.dart';
import 'package:http/http.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    Response response = await get(url);
    List<dynamic> data = jsonDecode(response.body);
    _products = data.map((item) => Product.fromJson(item)).toList();
    notifyListeners();
  }

  // You can add more methods here for modifying the products list, if needed
}
