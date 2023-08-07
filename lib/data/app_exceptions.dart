class AppExceptions implements Exception {
  final message;
  final prefix;
  AppExceptions([this.message, this.prefix]);

  String toString() {
    return '$prefix$message';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super(message, 'No Internet');
}

class RequestTimeoutExceptions extends AppExceptions {
  RequestTimeoutExceptions([String? message])
      : super(message, 'Request time out');
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message]) : super(message, 'Internal Server Error');
}

class InvalidUrlExceptions extends AppExceptions {
  InvalidUrlExceptions([String? message]) : super(message, 'Invalid url');
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions([String? message])
      : super(message, 'Error retrieving API');
}
