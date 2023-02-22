class KlipperCommandError implements Exception {
  final String error;
  final String message;

  KlipperCommandError(this.error, this.message);

  @override
  String toString() => "$error: $message";
}
