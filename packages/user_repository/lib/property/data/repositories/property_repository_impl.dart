// import 'package:dartz/dartz.dart';
// import 'package:urgent/core/failure/failures.dart';
// import 'package:urgent/features/property/data/data_sources/property_datasource.dart';
// import 'package:urgent/features/property/data/models/property_response/property_response.dart';
// import 'package:urgent/features/property/domain/entities/property_entity.dart';
// import 'package:urgent/features/property/domain/repositories/property_repository.dart';
//
// class PropertyRepositoryImpl implements PropertyRepository {
//   final PropertyDataSource _propertyDataSource;
//
//   PropertyRepositoryImpl(this._propertyDataSource);
//
//   @override
//   Future<Either<Failure, PropertyEntity>> getPropertyById(
//       {required String id}) async {
//     try {
//       final response = await _propertyDataSource.getPropertyById(id: id);
//
//       final PropertyResponse homePropertyResponse =
//           PropertyResponse.fromJson(response.data);
//
//       return Right(
//           homePropertyResponse.toEntity().property ?? PropertyEntity());
//
//       //todo: real right return
//     } catch (e) {
//       return Left(Failure(
//         e.toString(),
//       ));
//     }
//   }
// }
