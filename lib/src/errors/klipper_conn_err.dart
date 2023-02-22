class KlipperConnectionError implements Exception {
  final String message;

  KlipperConnectionError(this.message);

  @override
  String toString() => "KlipperConnectionError: $message";
}
