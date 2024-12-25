class UnexpectedError implements Exception {
  final String message;

  UnexpectedError(this.message);

  @override
  String toString() {
    return 'UnexpectedError: $message';
  }
}
