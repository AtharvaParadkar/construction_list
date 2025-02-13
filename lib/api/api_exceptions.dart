// exceptions.dart
class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);
  // allows you to provide a custom, descriptive error message.
  @override
  String toString() => "BadRequestException: $message";
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);

  @override
  String toString() => "UnauthorizedException: $message";
}

class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);

  @override
  String toString() => "FetchDataException: $message";
}
