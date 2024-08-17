import 'dart:async';
import 'package:flutter/material.dart';

import 'package:bento_challenge/models/product_model.dart';
import 'package:bento_challenge/repository/products_repository.dart';

abstract class _LocalProductsRepository {
  /// get product through id in repository folder
  Future<ProductModel> getProductByID();

  /// get products of repository folder
  Future<List<ProductModel>> getProducts();
}

/// This class was created to simulate a data request.
class ProductsController extends ChangeNotifier implements _LocalProductsRepository {
  late String _id;

  Future<void> setId(id) async {
    _id = id;
    notifyListeners();
  }

  @override
  Future<ProductModel> getProductByID() async {
    await Future.delayed(Duration(milliseconds: 2100));

    return products.firstWhere((product) => product.id == _id);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(Duration(milliseconds: 2100));

    return products;
  }
}
