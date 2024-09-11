// import 'package:urgent/core/base/domain/base_response.dart';
// import 'package:urgent/features/property/data/models/property_response/data.dart';
// import 'package:urgent/features/property/domain/entities/data_entity.dart';
//
// class PropertyResponse extends BaseResponse<DataEntity> {
//   Data? data;
//
//   PropertyResponse({this.data});
//
//   PropertyResponse.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   @override
//   DataEntity toEntity() {
//     return DataEntity(property: data?.property?.toEntity());
//   }
// }
