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
  late double _price;
  late double _discount;

  double get price => _price;
  double get discount => _discount;

  Future<void> setId(id) async {
    _id = id;
    notifyListeners();
  }

  @override
  Future<ProductModel> getProductByID() async {
    await Future.delayed(Duration(milliseconds: 2600));

    ProductModel product = products.firstWhere(
      (product) => product.id == _id,
    );

    _price = product.price;
    _discount = product.discount!;

    return product;
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(Duration(milliseconds: 2100));

    return products;
  }
}
