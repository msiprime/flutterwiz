// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:urgent/features/property/domain/entities/property_entity.dart';
// import 'package:urgent/features/property/domain/use_cases/property_by_id_usecase.dart';
//
// part 'property_details_state.dart';
//
// class PropertyDetailsCubit extends Cubit<PropertyDetailsState> {
//   final PropertyByIdUseCase _propertyByIdUseCase;
//
//   PropertyDetailsCubit(this._propertyByIdUseCase)
//       : super(const PropertyDetailsInitial());
//
//   Future<void> getPropertyById(String id) async {
//     emit(const PropertyDetailsLoading());
//     try {
//       final response = await _propertyByIdUseCase(id);
//       response.fold(
//         (l) => emit(PropertyDetailsError(l.message)),
//         (r) => emit(PropertyDetailsLoaded(r)),
//       );
//     } catch (e) {
//       emit(PropertyDetailsError(e.toString()));
//     }
//   }
// }
