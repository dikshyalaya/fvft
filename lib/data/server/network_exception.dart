class NetworkException implements Exception {
  final _message;
  final _prefix;
  NetworkException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message])
      : super(message, 'Error Communicating to the server');
}

class BadRequestException extends NetworkException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorized request');
}

class InvalidInputException extends NetworkException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
