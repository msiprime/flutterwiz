import "package:flutter_exploring/failure/failure.dart";
import "package:fpdart/fpdart.dart";

import "../../data/models/params/login_params.dart";
import "../entities/login_entity.dart";
import "../repositories/login_repository.dart";

class GetLogin {
  final LoginRepository loginRepository;

  GetLogin({required this.loginRepository});

  Future<Either<Failure, LoginEntity>> call({
    required LoginParams params,
  }) {
    return loginRepository.getLogin(loginParams: params);
  }
}
