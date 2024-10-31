import 'package:dartz/dartz.dart';
import 'package:flutter_exploring/features/user/data/data_sources/user_ds.dart';
import 'package:flutter_exploring/features/user/data/models/user_model.dart';
import 'package:flutter_exploring/features/user/domain/entities/user.dart';
import 'package:flutter_exploring/features/user/domain/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl(this.userDataSource);

  final UserDS userDataSource;

  @override
  Future<Either<String, List<User>>> fetchUsers() async {
    try {
      final response = await userDataSource.fetchUsers();

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;

        final users = data
            .map(
              (e) => UserModel.fromJson(e as Map<String, dynamic>).toEntity(),
            )
            .toList();

        return Right(users);
      } else {
        return const Left('Failed to fetch users');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
