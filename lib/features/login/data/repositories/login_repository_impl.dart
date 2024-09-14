import "package:fpdart/fpdart.dart";

import "../../../../core/services/connection/network_info.dart";
import "../../../../core/errors/error_handler.dart";
import "../../../../core/errors/failure.dart";


import "../../business/repositories/login_repository.dart";
import "../data_sources/local/login_local_data_source.dart";
import "../data_sources/remote/login_remote_data_source.dart";
import "../models/dtos/login_model.dart";
import "../models/params/login_params.dart";

/// Data operations for the Login collection
class LoginRepositoryImpl implements LoginRepository {
  /// Data operations for the Login collection
  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  
final LoginRemoteDataSource remoteDataSource;
final LoginLocalDataSource localDataSource;
final NetworkInfo networkInfo;

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer.
  */

  @override
  Future<Either<Failure, LoginModel>> getLogin(
      {required LoginParams loginParams}) async {

    if (await networkInfo.isConnected) {
      return ErrorHandler.handleApiCall<LoginModel>(
        () {
          return remoteDataSource.getLogin(loginParams: loginParams);
        },
      );
    } else {
      return ErrorHandler.handleCacheCall<LoginModel>(
        () {
          return localDataSource.getLastLogin();
        },
      );
    }
  }
}
