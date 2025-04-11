extension StringExtensions on String {
  String toCapitalize(String sentence) {
    final List<String> words = sentence.split(" ");
    return words
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}}',
        )
        .join("");
  }
}
