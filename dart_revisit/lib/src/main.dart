void main(List<String> args) {
  const letters = <String>[
    'a',
    'b',
    'c',
  ];

  /// correct way to update a list
  /// both `letters` and `updatedLetters` are immutable
  /// works with both `const` and `final`

  const updatedLetters = [...letters, 'd'];

  print(updatedLetters);
}
