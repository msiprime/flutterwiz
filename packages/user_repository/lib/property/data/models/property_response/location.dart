// import 'package:urgent/core/base/domain/base_response.dart';
// import 'package:urgent/features/property/domain/entities/location.dart';
//
// class Location extends BaseResponse<LocationEntity> {
//   String? type;
//   List<double>? coordinates;
//
//   Location({this.type, this.coordinates});
//
//   Location.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     coordinates = json['coordinates'].cast<double>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['coordinates'] = this.coordinates;
//     return data;
//   }
//
//   @override
//   LocationEntity toEntity() {
//     return LocationEntity(type: type, coordinates: coordinates);
//   }
// }
