extension StringExtensions on String? {
  bool get isEmptyOrNull => this == null || this!.trim().isEmpty;
  bool get isNotEmptyOrNull => !isEmptyOrNull;
}
