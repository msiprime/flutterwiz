import 'package:dio/dio.dart';

//ignore: one_member_abstracts
abstract interface class UserDS {
  Future<Response<dynamic>> fetchUsers();
}

class UserDSImpl implements UserDS {
  UserDSImpl(this.dio);

  final Dio dio;

  @override
  Future<Response<dynamic>> fetchUsers() async {
    try {
      final response = await dio
          .get<List<dynamic>>('https://jsonplaceholder.typicode.com/users');

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
