import 'package:flutter/material.dart';

import 'package:bento_challenge/models/product_model.dart';
import 'package:bento_challenge/models/specification_model.dart';

const products = [
  ProductModel(
    id: '#orangefakeid',
    idCategory: '#fruitsfakeid',
    title: 'Organic Fresh Orange',
    description: 'the valencia orange is a widely popular variety, known for its sweet and juicy flavor. its smooth, thin skin and tightly packed segments make it ideal for juicing. named after the region in Spain where it originated, this orange is a favorite worldwide. whether eaten fresh or used in recipes, its vibrant taste is highly cherished.',
    storeName: 'Alisha Mart',
    price: 8.15,
    discount: 6.90,
    stars: 4.5,
    backgroundColor: Color(0XFFFAF0DC),
    imagesPath: [
      'orange.png',
      'orange.png',
      'orange.png',
    ],
    specifications: [
      SpecificationModel(
        name: 'Vitamin C',
        imagePath: 'vitamin-c.png',
        color: Color(0xFFF3F0C0),
      ),
      SpecificationModel(
        name: 'Antioxidant',
        imagePath: 'antioxidant.png',
        color: Color(0xFFBFeFF0),
      ),
      SpecificationModel(
        name: 'Fiber Source',
        imagePath: 'fiber-source.png',
        color: Color(0xFFFCCACA),
      ),
    ],
  ),
  ProductModel(
    id: '#cabbagefakeid',
    idCategory: '#veganfakeid',
    title: 'Organic Fresh Green Cabbage',
    description: 'are commonly known as green cabbage. the cannoball cabbage is on of the most popular cabbage varieties. It is so named for the way its leaves wound tightly over one.',
    storeName: 'Alisha Mart',
    price: 8.15,
    discount: 6.90,
    stars: 4.5,
    backgroundColor: Color(0xFFE6FADC),
    imagesPath: [
      'cabbage.png',
      'cabbage.png',
      'cabbage.png',
    ],
    specifications: [
      SpecificationModel(
        name: 'Vegetarian',
        imagePath: 'vegetarian.png',
        color: Color(0xFFBEF0BE),
      ),
      SpecificationModel(
        name: 'Halal food',
        imagePath: 'halal-food.png',
        color: Color(0xFFF3F0C0),
      ),
      SpecificationModel(
        name: 'Gluten-free',
        imagePath: 'gluten-free.png',
        color: Color(0xFFBFeFF0),
      ),
    ],
  ),
];
