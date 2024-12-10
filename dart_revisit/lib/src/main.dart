//ignore_for_file: avoid_print
//ignore_for_file: public_member_api_docs

void main() {
  final obj1 = Transaction(
    name: 'Msi Sakib',
    age: '27',
    id: 'Asa12AssocZfeAds',
    transactionId: '3AsxDawn13as2',
  );

  final obj2 = Transaction(
    name: 'Msi Sakib',
    age: '28',
    id: 'Asa12AssocZfeAds',
    transactionId: '3AsxDawn13as2',
  );

  final onj3 = Transaction(
    name: 'Msi Sakib',
    age: '29',
    id: 'Asa12AssocZfeAds',
    transactionId: '3AsxDawn13as2',
  );

  print(obj1.hashCode == obj2.hashCode);
  print(obj2 == onj3);

  print('Object 1 hashcode: ${obj1.hashCode}');
  print('Object 2 hashcode: ${obj2.hashCode}');
  print('Object 3 hashcode: ${onj3.hashCode}');
}

// String? doSomething(String? a, String? b) {
//   return a != null
//       ? a.isEmpty
//           ? a = 'A is empty'
//           : a = 'A is not empty'
//       : a ??= b;
// }

class Transaction {
  Transaction({
    required this.id,
    required this.name,
    required this.age,
    required this.transactionId,
  });

  String id;
  String name;
  String age;
  String transactionId;

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }
}
