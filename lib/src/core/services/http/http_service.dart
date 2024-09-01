import 'package:flutter_utils/src/core/services/http/http_interface.dart';

import 'responses/http_response.dart';

class HttpService {
  final HttpInterface http;

  HttpService({required this.http});

  Future<HttpResponse> delete(String url,
      {Map<String, String>? headers, body}) async {
    HttpResponse response =
        await http.delete(url, headers: headers, body: body);
    return response;
  }

  Future<HttpResponse> get(String url,
      {Map<String, String>? headers, dynamic body}) async {
    HttpResponse response = await http.get(url, headers: headers);
    return response;
  }

  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Map? body}) async {
    HttpResponse response = await http.post(url, headers: headers);
    return response;
  }

  Future<HttpResponse> put(String url, {headers, body}) async {
    HttpResponse response = await http.put(url, headers: headers);
    return response;
  }
}
