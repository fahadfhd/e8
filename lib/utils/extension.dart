extension StringExtension on String {
  String asAssetjpeg() => 'assets/images/$this.jpeg';
  String asAssetpng() => 'assets/images/$this.png';
}
