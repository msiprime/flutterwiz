import "dart:convert";

import "../../../business/entities/login_entity.dart";

/// Model that transforms the Login data from the API to the
/// application entity
class LoginModel extends LoginEntity {
  /// Model that transforms the Login data from the API to the
  /// application entity
  const LoginModel();

  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

  /// Factory method to create a Home model instance from a JSON
  factory LoginModel.fromJson({required String json}) => LoginModel.fromMap(map: jsonDecode(json));

  /// Factory method to create a Login model instance from a map
  factory LoginModel.fromMap({required Map<String, dynamic> map}) =>
     const LoginModel();

  /// Factory method to create a Login model instance from an 
  /// entity
  factory LoginModel.fromEntity({required LoginEntity entity}) => const LoginModel();

  /// Converts the Login model instance to a map
  Map<String, dynamic> toMap() => {};

  /// Converts the Home model instance to a JSON
  String toJson() => jsonEncode(toMap());
  
  /// Converts the Login model instance to an entity
  LoginEntity toEntity() => const LoginEntity();
}
