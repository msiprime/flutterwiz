class RestClient {
  static final RestClient _instance = RestClient._internal();

  RestClient._internal();

  factory RestClient() => _instance;
}

// ignore_for_file: avoid_print

void main() {
  final restClient1 = RestClient();
  final restClient2 = RestClient();

  print(identical(restClient1, restClient2)); // true
}
