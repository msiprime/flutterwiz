//ignore_for_file: avoid_print
//ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

void main() {
  final obj1 = Transaction(
    name: 'Msi',
    age: '26',
    id: 'Asa12AassocZfeAds',
  );

  final obj2 = Transaction(
    name: 'Msi',
    age: '26',
    id: 'Asa12sAssocZfeAds',
  );

  final obj3 = Transaction(
    name: 'Msi',
    age: '26',
    id: 'Asfa12AssocZfeAds',
  );

  final obj4 = obj1;

  final mySet = {obj1, obj2, obj3, obj4};

  print(mySet);

  print('Object 1 hashcode: ${obj1.hashCode}');
  print('Object 2 hashcode: ${obj2.hashCode}');
  print('Object 3 hashcode: ${obj3.hashCode}');
}

class Transaction extends Equatable {
  Transaction({
    required this.id,
    required this.name,
    required this.age,
    String? transactionId,
  }) : transactionId = transactionId ?? const Uuid().v1();

  final String id;
  final String name;
  final String age;
  final String transactionId;

  @override
  String toString() => transactionId.substring(0, 12);

  @override
  List<Object?> get props => [transactionId];
}
