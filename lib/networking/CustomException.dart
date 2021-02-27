class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class DataNotFound extends CustomException {
  DataNotFound([message]) : super(message, "404 not found ");
}

class TooMany extends CustomException {
  TooMany([String message]) : super(message, "Too many requests, calm down ");
}

//want monogatari but no fanservice? watch bunny girl senpai
class Server extends CustomException {
  Server([String message]) : super(message, "Server seems down rn");
}
