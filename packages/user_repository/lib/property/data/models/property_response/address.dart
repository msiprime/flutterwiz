// import 'package:urgent/core/base/domain/base_response.dart';
// import 'package:urgent/features/property/domain/entities/address.dart';
//
// class Address extends BaseResponse<AddressEntity> {
//   String? addressLine1;
//   String? addressLine2;
//   String? city;
//   String? country;
//   String? zipCode;
//
//   Address({
//     this.addressLine1,
//     this.addressLine2,
//     this.city,
//     this.country,
//     this.zipCode,
//   });
//
//   Address.fromJson(Map<String, dynamic> json) {
//     addressLine1 = json['addressLine1'];
//     addressLine2 = json['addressLine2'];
//     city = json['city'];
//     country = json['country'];
//     zipCode = json['zipCode'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['addressLine1'] = addressLine1;
//     data['addressLine2'] = addressLine2;
//     data['city'] = city;
//     data['country'] = country;
//     data['zipCode'] = zipCode;
//     return data;
//   }
//
//   @override
//   AddressEntity toEntity() {
//     return AddressEntity(
//         addressLine1: addressLine1,
//         addressLine2: addressLine2,
//         city: city,
//         country: country,
//         zipCode: zipCode);
//   }
// }
