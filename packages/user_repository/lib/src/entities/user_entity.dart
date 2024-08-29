class MyUserEntity {
  final String id;
  final String name;
  final String email;

  MyUserEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
    );
  }
}
