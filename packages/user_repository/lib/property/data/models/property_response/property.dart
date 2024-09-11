// import 'package:urgent/core/base/domain/base_response.dart';
// import 'package:urgent/features/property/data/models/property_response/address.dart';
// import 'package:urgent/features/property/data/models/property_response/contact_info.dart';
// import 'package:urgent/features/property/data/models/property_response/location.dart';
// import 'package:urgent/features/property/domain/entities/property_entity.dart';
//
// class Property extends BaseResponse<PropertyEntity> {
//   String? sId;
//   String? id;
//   String? type;
//   Location? location;
//   String? categoryId;
//   String? userId;
//   String? subCategoryId;
//   int? price;
//   String? title;
//   String? description;
//   List<Null>? keywords;
//   List<Null>? amenities;
//   String? furnishingType;
//   List<Null>? agencies;
//   String? completionStatus;
//   List<String>? photos;
//   String? currency;
//   ContactInfo? contactInfo;
//   String? coverPhoto;
//   Address? address;
//   bool? isNegotiable;
//   bool? isDeleted;
//   bool? isActive;
//   bool? isApproved;
//   bool? isExpired;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//
//   Property(
//       {this.sId,
//       this.id,
//       this.type,
//       this.location,
//       this.categoryId,
//       this.userId,
//       this.subCategoryId,
//       this.price,
//       this.title,
//       this.description,
//       this.keywords,
//       this.amenities,
//       this.furnishingType,
//       this.agencies,
//       this.completionStatus,
//       this.photos,
//       this.currency,
//       this.contactInfo,
//       this.coverPhoto,
//       this.address,
//       this.isNegotiable,
//       this.isDeleted,
//       this.isActive,
//       this.isApproved,
//       this.isExpired,
//       this.status,
//       this.createdAt,
//       this.updatedAt});
//
//   Property.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     id = json['id'];
//     type = json['type'];
//     location =
//         json['location'] != null ? Location.fromJson(json['location']) : null;
//     categoryId = json['categoryId'];
//     userId = json['userId'];
//     subCategoryId = json['subCategoryId'];
//     price = json['price'];
//     title = json['title'];
//     description = json['description'];
//     if (json['keywords'] != null) {
//       keywords = <Null>[];
//       json['keywords'].forEach((v) {
//         keywords!.add({} as Null);
//       });
//     }
//     if (json['amenities'] != null) {
//       amenities = <Null>[];
//       json['amenities'].forEach((v) {
//         amenities!.add({} as Null);
//       });
//     }
//     furnishingType = json['furnishingType'];
//     if (json['agencies'] != null) {
//       agencies = <Null>[];
//       json['agencies'].forEach((v) {
//         agencies!.add({} as Null);
//       });
//     }
//     completionStatus = json['completionStatus'];
//     photos = json['photos'].cast<String>();
//     currency = json['currency'];
//     contactInfo = json['contactInfo'] != null
//         ? ContactInfo.fromJson(json['contactInfo'])
//         : null;
//     coverPhoto = json['coverPhoto'];
//     address =
//         json['address'] != null ? new Address.fromJson(json['address']) : null;
//     isNegotiable = json['isNegotiable'];
//     isDeleted = json['isDeleted'];
//     isActive = json['isActive'];
//     isApproved = json['isApproved'];
//     isExpired = json['isExpired'];
//     status = json['status'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }
//
//   @override
//   PropertyEntity toEntity() {
//     return PropertyEntity(
//         sId: sId,
//         id: id,
//         type: type,
//         location: location,
//         categoryId: categoryId,
//         userId: userId,
//         subCategoryId: subCategoryId,
//         price: price,
//         title: title,
//         description: description,
//         keywords: keywords,
//         amenities: amenities,
//         furnishingType: furnishingType,
//         agencies: agencies,
//         completionStatus: completionStatus,
//         photos: photos,
//         currency: currency,
//         contactInfo: contactInfo,
//         coverPhoto: coverPhoto,
//         address: address,
//         isNegotiable: isNegotiable,
//         isDeleted: isDeleted,
//         isActive: isActive,
//         isApproved: isApproved,
//         isExpired: isExpired,
//         status: status,
//         createdAt: createdAt,
//         updatedAt: updatedAt);
//   }
// }
