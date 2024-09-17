void main() {
  print(uncommonFromSentences('this apple is sweet', 'this apple is sour'));
}

List<String> uncommonFromSentences(String s1, String s2) {
  final List<String> words = ('$s1 $s2').split(' ');
  final Map<String, int> wordCount = {};

  for (var word in words) {
    wordCount[word] = (wordCount[word] ?? 0) + 1;
  }

  return wordCount.entries
      .where((entry) => entry.value == 1)
      .map((entry) => entry.key)
      .toList();
}
