import 'dart:convert';

import 'package:flutter_exploring/bioxin_search/data/data_sources/product_datasource.dart';
import 'package:flutter_exploring/bioxin_search/data/models/product_response.dart';
import 'package:flutter_exploring/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl();

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final productResponse =
          ProductResponse.fromJson(json.decode(jsonResponse));
      return Right(productResponse.products!);
    } catch (e) {
      return Left(Failure('Error fetching products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getPopularProducts() async {
    try {
      final productResponse =
          ProductResponse.fromJson(json.decode(jsonResponse));
      return Right(productResponse.popularProducts!);
    } catch (e) {
      return Left(Failure('Error fetching popular products'));
    }
  }
}

const jsonResponse = '''
{
    "popular_products": [
        {
            "id": 1,
            "productCoverImage": "https://picsum.photos/id/51/300",
            "productName": "Radiant Glow Serum",
            "brand": "GlowCo",
            "price": 29.99,
            "rating": 4.8,
            "category": "Skincare"
        },
        {
            "id": 2,
            "productCoverImage": "https://picsum.photos/id/52/300",
            "productName": "Velvet Matte Lipstick",
            "brand": "LuxeBeauty",
            "price": 19.99,
            "rating": 4.7,
            "category": "Makeup"
        },
        {
            "id": 3,
            "productCoverImage": "https://picsum.photos/id/53/300",
            "productName": "Hydrating Facial Cleanser",
            "brand": "PureSkin",
            "price": 24.99,
            "rating": 4.6,
            "category": "Skincare"
        },
        {
            "id": 4,
            "productCoverImage": "https://picsum.photos/id/10/300",
            "productName": "Ultra Repair Cream",
            "brand": "SkinFix",
            "price": 34.99,
            "rating": 4.9,
            "category": "Skincare"
        },
        {
            "id": 5,
            "productCoverImage": "https://picsum.photos/id/11/300",
            "productName": "Luminous Foundation",
            "brand": "GlamUp",
            "price": 39.99,
            "rating": 4.7,
            "category": "Makeup"
        },
        {
            "id": 6,
            "productCoverImage": "https://picsum.photos/id/12/300",
            "productName": "Volumizing Mascara",
            "brand": "LashLift",
            "price": 22.99,
            "rating": 4.5,
            "category": "Makeup"
        },
        {
            "id": 7,
            "productCoverImage": "https://picsum.photos/id/13/300",
            "productName": "Nourishing Hair Oil",
            "brand": "HairEssence",
            "price": 18.99,
            "rating": 4.6,
            "category": "Haircare"
        },
        {
            "id": 8,
            "productCoverImage": "https://picsum.photos/id/55/300",
            "productName": "Soothing Face Mask",
            "brand": "CalmBeauty",
            "price": 15.99,
            "rating": 4.8,
            "category": "Skincare"
        },
        {
            "id": 9,
            "productCoverImage": "https://picsum.photos/id/14/300",
            "productName": "Brightening Eye Cream",
            "brand": "EyeCare",
            "price": 25.99,
            "rating": 4.7,
            "category": "Skincare"
        },
        {
            "id": 10,
            "productCoverImage": "https://picsum.photos/id/14/300",
            "productName": "Revitalizing Night Cream",
            "brand": "NightGlow",
            "price": 29.99,
            "rating": 4.9,
            "category": "Skincare"
        }
    ],
    "products": [
        {
            "id": 11,
            "productCoverImage": "https://picsum.photos/id/15/300",
            "productName": "Daily Moisturizer",
            "brand": "Moistura",
            "price": 19.99,
            "rating": 4.5,
            "category": "Skincare"
        },
        {
            "id": 12,
            "productCoverImage": "https://picsum.photos/id/16/300",
            "productName": "Matte Liquid Lipstick",
            "brand": "LipLuxe",
            "price": 14.99,
            "rating": 4.4,
            "category": "Makeup"
        },
        {
            "id": 13,
            "productCoverImage": "https://picsum.photos/id/20/300",
            "productName": "Exfoliating Scrub",
            "brand": "ScrubIt",
            "price": 17.99,
            "rating": 4.6,
            "category": "Skincare"
        },
        {
            "id": 14,
            "productCoverImage": "https://picsum.photos/id/21/300",
            "productName": "Longwear Eyeliner",
            "brand": "EyeLine",
            "price": 11.99,
            "rating": 4.3,
            "category": "Makeup"
        },
        {
            "id": 15,
            "productCoverImage": "https://picsum.photos/id/22/300",
            "productName": "Clarifying Shampoo",
            "brand": "HairCleanse",
            "price": 13.99,
            "rating": 4.4,
            "category": "Haircare"
        },
        {
            "id": 16,
            "productCoverImage": "https://picsum.photos/id/23/300.png",
            "productName": "Deep Conditioner",
            "brand": "HydraHair",
            "price": 16.99,
            "rating": 4.6,
            "category": "Haircare"
        },
        {
            "id": 17,
            "productCoverImage": "https://picsum.photos/id/24/300",
            "productName": "Anti-Aging Serum",
            "brand": "YouthfulSkin",
            "price": 39.99,
            "rating": 4.7,
            "category": "Skincare"
        },
        {
            "id": 18,
            "productCoverImage": "https://picsum.photos/id/25/300",
            "productName": "Illuminating Highlighter",
            "brand": "GlowUp",
            "price": 21.99,
            "rating": 4.5,
            "category": "Makeup"
        },
        {
            "id": 19,
            "productCoverImage": "https://picsum.photos/id/26/300",
            "productName": "Reparative Hair Mask",
            "brand": "RepairLocks",
            "price": 24.99,
            "rating": 4.6,
            "category": "Haircare"
        },
        {
            "id": 20,
            "productCoverImage": "https://picsum.photos/id/27/300",
            "productName": "Refreshing Face Mist",
            "brand": "Mistify",
            "price": 14.99,
            "rating": 4.4,
            "category": "Skincare"
        },
        {
            "id": 21,
            "productCoverImage": "https://picsum.photos/id/28/300",
            "productName": "Cream Blush",
            "brand": "Cheeky",
            "price": 18.99,
            "rating": 4.5,
            "category": "Makeup"
        },
        {
            "id": 22,
            "productCoverImage": "https://picsum.photos/id/29/300",
            "productName": "Sun Protection Lotion",
            "brand": "SunSafe",
            "price": 29.99,
            "rating": 4.7,
            "category": "Skincare"
        },
        {
            "id": 23,
            "productCoverImage": "https://picsum.photos/id/30/300",
            "productName": "Lip Balm",
            "brand": "LipSaver",
            "price": 5.99,
            "rating": 4.3,
            "category": "Makeup"
        },
        {
            "id": 24,
            "productCoverImage": "https://picsum.photos/id/31/300",
            "productName": "Detangling Spray",
            "brand": "HairEase",
            "price": 12.99,
            "rating": 4.5,
            "category": "Haircare"
        },
        {
            "id": 25,
            "productCoverImage": "https://picsum.photos/id/34/300",
            "productName": "Pore Minimizing Toner",
            "brand": "TightenUp",
            "price": 19.99,
            "rating": 4.4,
            "category": "Skincare"
        },
        {
            "id": 26,
            "productCoverImage": "https://picsum.photos/id/35/300",
            "productName": "Hydrating Face Primer",
            "brand": "PrimeTime",
            "price": 22.99,
            "rating": 4.6,
            "category": "Makeup"
        },
        {
            "id": 27,
            "productCoverImage": "https://picsum.photos/id/36/300",
            "productName": "Frizz Control Serum",
            "brand": "SmoothLocks",
            "price": 17.99,
            "rating": 4.5,
            "category": "Haircare"
        },
        {
            "id": 28,
            "productCoverImage": "https://picsum.photos/id/37/300",
            "productName": "Color Correcting Concealer",
            "brand": "Flawless",
            "price": 16.99,
            "rating": 4.6,
            "category": "Makeup"
        },
        {
            "id": 29,
            "productCoverImage": "https://picsum.photos/id/38/300",
            "productName": "Purifying Clay Mask",
            "brand": "DeepCleanse",
            "price": 19.99,
            "rating": 4.7,
            "category": "Skincare"
        },
        {
            "id": 30,
            "productCoverImage": "https://picsum.photos/id/40/300",
            "productName": "Brow Defining Pencil",
            "brand": "BrowMaster",
            "price": 12.99,
            "rating": 4.4,
            "category": "Makeup"
        }
    ]
}''';
