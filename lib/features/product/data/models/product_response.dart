import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';

class ProductResponse {
  List<ProductModel>? popularProducts;
  List<ProductModel>? products;

  ProductResponse({this.popularProducts, this.products});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['popular_products'] != null) {
      popularProducts = <ProductModel>[];
      json['popular_products'].forEach((v) {
        popularProducts!.add(ProductModel.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? productCoverImage;
  String? productName;
  String? brand;
  double? price;
  double? rating;
  String? category;

  ProductModel(
      {this.id,
      this.productCoverImage,
      this.productName,
      this.brand,
      this.price,
      this.rating,
      this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productCoverImage = json['productCoverImage'];
    productName = json['productName'];
    brand = json['brand'];
    price = json['price'];
    rating = json['rating'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productCoverImage'] = productCoverImage;
    data['productName'] = productName;
    data['brand'] = brand;
    data['price'] = price;
    data['rating'] = rating;
    data['category'] = category;
    return data;
  }

  ProductEntity toEntity() {
    return ProductEntity(
        id: id,
        productCoverImage: productCoverImage,
        productName: productName,
        brand: brand,
        price: price,
        rating: rating,
        category: category);
  }
}
