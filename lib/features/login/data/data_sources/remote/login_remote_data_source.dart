import "../../../../../core/adapters/dio_adapter.dart";
import "../../models/params/login_params.dart";
import "../../models/dtos/login_model.dart";

/// Remote data source for the Login collection
abstract class LoginRemoteDataSource {

  /*
  A remote data source is responsible for abstracting the API layer from the data layer. 
  The data source's main functions are:
    Data Retrieval: It fetches data from the specified source. This could involve making a network request to an API, querying a database, or reading a file.
    Data Storage: It saves data back to the source. This could involve making a POST request to an API, executing an INSERT query on a database, or writing to a file.
    Data Conversion: It often converts the data into a format that the rest of the application can use. This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

  Future<LoginModel> getLogin({
    required LoginParams loginParams,
  });
  
}

/// Remote data source for the Login collection
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  /// Remote data source for the Login collection
 LoginRemoteDataSourceImpl({required this.dio});

  /// Dio adapter instance
  final DioAdapter dio;

  /*
  The remote data source implementation is responsible for making the actual API requests. 
  It is responsible for converting the data into a format that the rest of the application can use. This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

  @override
  Future<LoginModel> getLogin({
    required LoginParams loginParams,
  }) async {
    final response = await dio.get(
      "YOUR_API_URL_HERE",
      queryParameters: {
        "api_key": "if needed",
      },
    );

   return LoginModel.fromJson(json: response.data);
   
  }
 
}
