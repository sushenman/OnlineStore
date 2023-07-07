import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Model/product.dart';
import 'package:flutter/material.dart';

void initState() {
  Future.delayed(Duration(seconds: 2), () {
    ApiService();
  });
}

class ApiService {
  Map<String, dynamic> d = {};
  List<dynamic> products = [];
  List<Product> modelList = [];
  String dataencoded = '';

List<dynamic> originalModelList = [];
  void callAllProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    Response response = await get(url);
    List<dynamic> data = jsonDecode(response.body);
    modelList = data.map((item) => Product.fromJson(item)).toList();
    print(response.body);
    // print(modelList.length);
  
  }
}
