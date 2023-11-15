import 'dart:convert';

class HttpResponse {


  final String? rawBody;
  final int? statusCode;
  final Map<String?, String>? headers;

  HttpResponse({this.rawBody, this.statusCode, this.headers});

  Map<dynamic, dynamic>? getBody() {
    if (rawBody == null) {
      return {};
    }
    return jsonDecode(rawBody!);
  }
}