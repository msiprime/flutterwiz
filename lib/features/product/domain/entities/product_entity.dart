import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? productCoverImage;
  final String? productName;
  final String? brand;
  final double? price;
  final double? rating;
  final String? category;

  const ProductEntity({
    this.id,
    this.productCoverImage,
    this.productName,
    this.brand,
    this.price,
    this.rating,
    this.category,
  });

  @override
  List<Object?> get props => [
        id,
        productCoverImage,
        productName,
        brand,
        price,
        rating,
        category,
      ];
}
