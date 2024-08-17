import 'package:bento_challenge/models/specification_model.dart';

class ProductModel {
  final String id;
  final String idCategory;
  final String title;
  final String description;
  final String storeName;
  final double price;
  final double? discount;
  final double stars;
  final List<String> imagesPath;
  final List<SpecificationModel> specifications;

  const ProductModel({
    required this.id,
    required this.idCategory,
    required this.title,
    required this.description,
    required this.storeName,
    required this.price,
    required this.discount,
    required this.stars,
    required this.imagesPath,
    required this.specifications,
  });
}
