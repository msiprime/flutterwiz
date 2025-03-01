abstract interface class Images {
  static const String _path =
      'lib/features/ai_test/presentation/assets/images/';
  static const String logo = '${_path}logo.png';

  void something() {
    print('something');
  }
}

class C implements Images {
  // ayo what the fuck
  @override
  void something() {
    print('something');
  }
}
