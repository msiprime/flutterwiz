// import 'package:dio/dio.dart';
// import 'package:urgent/core/network/api_end_points.dart';
// import 'package:urgent/core/network/rest_client.dart';
// import 'package:urgent/features/property/data/data_sources/property_datasource.dart';
//
// class PropertyDataSourceImpl implements PropertyDataSource {
//   final RestClient _restClient;
//
//   PropertyDataSourceImpl(this._restClient);
//
//   @override
//   Future<Response> getPropertyById({required String id}) async {
//     final response = await _restClient.get(
//       APIType.protected,
//       '${ApiEndPoints.propertyById}/$id',
//     );
//     return response;
//   }
// }
