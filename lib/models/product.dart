import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:shop/exceptions/http_exception.dart';

import '../utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  final _baseUrl = Constants.USER_FAVORITES_URL;

  Future<void> toggleFavorite(String token, userId) async {
    final isFavoriteOld = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    final response = await http.put(
      Uri.parse('$_baseUrl/$userId/$id.json?auth=$token'),
      body: jsonEncode(isFavorite),
    );

    if (response.statusCode >= 400) {
      isFavorite = isFavoriteOld;
      notifyListeners();
      throw HttpExceptionCustom(
        msg: 'Não foi possível definir o produto como favorito',
        statusCode: response.statusCode,
      );
    }
  }
}
