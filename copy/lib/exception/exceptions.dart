// アプリケーション全体で使用するエラー型
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

class NetworkException extends AppException {
  NetworkException(super.message, {this.retry});
  void Function()? retry;
}

class AuthException extends AppException {
  const AuthException(super.message);
}

class ValidationException extends AppException {
  const ValidationException(super.message, {this.fieldErrors});
  final Map<String, String>? fieldErrors;
}

class UnexpectedException extends AppException {
  const UnexpectedException(super.message);
}
