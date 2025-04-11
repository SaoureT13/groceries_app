extension StringExtensions on String {
  String toCapitalize(String sentence) {
    final List<String> words = sentence.split(" ");
    return words
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(" ");
  }
}

// extension HexColor on String {
//   Color toColor() {
//     String hex = toUpperCase().replaceAll("#", "");
//     if (hex.length == 6) hex = "FF$hex";
//     return Color(int.parse(hex, radix: 16));
//   }
// }
