import 'package:user_repository/user_repository.dart';

class MyUser {
  final String id;
  final String name;
  final String email;

  MyUser({
    required this.id,
    required this.name,
    required this.email,
  });

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      name: name,
      email: email,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }
}
