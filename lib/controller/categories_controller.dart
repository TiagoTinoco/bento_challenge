import 'dart:async';
import 'package:flutter/material.dart';

import 'package:bento_challenge/models/category_model.dart';
import 'package:bento_challenge/repository/categories_repository.dart';

abstract class _LocalCategoriesRepository {
  /// get the categories of repository folder
  Future<List<CategoryModel>> getCategories();
}

/// This class was created to simulate a data request.
class CategoriesController extends ChangeNotifier implements _LocalCategoriesRepository {
  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(Duration(milliseconds: 1600));

    return categories;
  }
}
