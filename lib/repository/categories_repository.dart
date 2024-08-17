import 'dart:async';

import 'package:bento_challenge/models/category_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>> getCategories();
}

/// This class was created to simulate a data request.
class LocalCategoriesRepository implements CategoriesRepository {
  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(Duration(milliseconds: 1600));

    return const [
      CategoryModel(
        id: '#veganfakeid',
        name: 'Vegan',
        imagePath: 'vegan.png',
      ),
      CategoryModel(
        id: '#meatfakeid',
        name: 'Meat',
        imagePath: 'meat.png',
      ),
      CategoryModel(
        id: '#fruitsfakeid',
        name: 'Fruits',
        imagePath: 'fruits.png',
      ),
      CategoryModel(
        id: '#milkfakeid',
        name: 'Milk',
        imagePath: 'milk.png',
      ),
      CategoryModel(
        id: '#fishfakeid',
        name: 'Fish',
        imagePath: 'fish.png',
      ),
    ];
  }
}
