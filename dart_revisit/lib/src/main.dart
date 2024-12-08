void main(List<String> args) {
  final letters = <String>[
    'a',
    'b',
    'c',
  ];

  final updatedLetters = [...letters, 'd']; // ['a', 'b', 'c', 'd']

  print(updatedLetters);
}
