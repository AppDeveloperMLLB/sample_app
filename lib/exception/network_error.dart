class NetworkError implements Exception {
  final String message;

  NetworkError(this.message);

  @override
  String toString() {
    return 'NetworkError: $message';
  }
}
