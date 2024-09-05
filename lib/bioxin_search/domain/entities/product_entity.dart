class ProductEntity {
  int? id;
  String? productCoverImage;
  String? productName;
  String? brand;
  double? price;
  double? rating;
  String? category;

  ProductEntity(
      {this.id,
      this.productCoverImage,
      this.productName,
      this.brand,
      this.price,
      this.rating,
      this.category});
}
