class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final ProductDimensionsModel dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ProductReviewModel> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final ProductMetaModel meta;
  final String thumbnail;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'] as int,
      tags: List<String>.from(json['tags'] as List),
      brand: json['brand'] as String,
      sku: json['sku'] as String,
      weight: (json['weight'] as num).toDouble(),
      dimensions: ProductDimensionsModel.fromJson(
        json['dimensions'] as Map<String, dynamic>,
      ),
      warrantyInformation: json['warrantyInformation'] as String,
      shippingInformation: json['shippingInformation'] as String,
      availabilityStatus: json['availabilityStatus'] as String,
      reviews: (json['reviews'] as List)
          .map(
            (review) =>
                ProductReviewModel.fromJson(review as Map<String, dynamic>),
          )
          .toList(),
      returnPolicy: json['returnPolicy'] as String,
      minimumOrderQuantity: json['minimumOrderQuantity'] as int,
      meta: ProductMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] as String,
      images: List<String>.from(json['images'] as List),
    );
  }
}

class ProductDimensionsModel {
  final double width;
  final double height;
  final double depth;

  ProductDimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory ProductDimensionsModel.fromJson(Map<String, dynamic> json) {
    return ProductDimensionsModel(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );
  }
}

class ProductReviewModel {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  ProductReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      date: DateTime.parse(json['date'] as String),
      reviewerName: json['reviewerName'] as String,
      reviewerEmail: json['reviewerEmail'] as String,
    );
  }
}

class ProductMetaModel {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  ProductMetaModel({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory ProductMetaModel.fromJson(Map<String, dynamic> json) {
    return ProductMetaModel(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      barcode: json['barcode'] as String,
      qrCode: json['qrCode'] as String,
    );
  }
}
