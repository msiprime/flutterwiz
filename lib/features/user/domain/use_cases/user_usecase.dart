// domain/usecases/get_users.dart

import 'package:dartz/dartz.dart';
import 'package:flutter_exploring/features/user/domain/entities/user.dart';
import 'package:flutter_exploring/features/user/domain/repositories/user_repo.dart';

class GetUsers {
  GetUsers(this.repository);

  final UserRepo repository;

  Future<Either<String, List<User>>> call() async => repository.fetchUsers();
}
