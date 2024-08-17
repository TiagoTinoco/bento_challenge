import 'dart:async';
import 'package:flutter/material.dart';

import 'package:bento_challenge/models/product_model.dart';
import 'package:bento_challenge/repository/products_repository.dart';

abstract class LocalProductsRepository {
  Future<List<ProductModel>> getProducts();
}

/// This class was created to simulate a data request.
class ProductsController extends ChangeNotifier implements LocalProductsRepository {
  @override

  /// get the products of repository folder
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(Duration(milliseconds: 2100));

    return products;
  }
}
