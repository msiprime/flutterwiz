import "package:flutter_exploring/failure/failure.dart";
import "package:fpdart/fpdart.dart";

import "../../data/models/params/login_params.dart";
import "../entities/login_entity.dart";

/// Data operations for the Login collection
abstract class LoginRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<Either<Failure, LoginEntity>> getLogin({
    required LoginParams loginParams,
  });
}
