class HttpExceptionCustom implements Exception {
  final String msg;
  final int statusCode;

  HttpExceptionCustom({
    required this.msg,
    required this.statusCode,
  });

  @override
  String toString() {
    return msg;
  }
}
