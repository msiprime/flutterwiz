// import 'package:urgent/core/base/domain/base_response.dart';
// import 'package:urgent/features/property/data/models/property_response/property.dart';
// import 'package:urgent/features/property/domain/entities/data_entity.dart';
//
// class Data extends BaseResponse<DataEntity> {
//   Property? property;
//
//   Data({this.property});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     property =
//         json['property'] != null ? Property.fromJson(json['property']) : null;
//   }
//
//   @override
//   DataEntity toEntity() {
//     return DataEntity(property: property?.toEntity());
//   }
// }
