class AppException implements Exception {
  final _message;
  final _prifex;
  AppException([this._message, this._prifex]);

  @override
  String toString() {
    return '$_message$_prifex';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]): super(message, 'Error during communication');
}

class BadRewuestException extends AppException {
  BadRewuestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised request');
}

class InvaliadException extends AppException {
  InvaliadException([String? message]) : super(message, 'Invalid input');
}
