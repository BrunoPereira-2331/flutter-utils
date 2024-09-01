import 'package:flutter_utils/src/core/services/http/http_interface.dart';
import 'package:http/http.dart' as http_package;
import 'package:http/http.dart';

import 'responses/http_response.dart';

final class Http implements HttpInterface {
  @override
  Future<HttpResponse> delete(String url,
      {Map<String, String>? headers, body}) async {
    Response response =
        await http_package.delete(Uri.parse(url), headers: headers, body: body);
    return HttpResponse(
      rawBody: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponse> get(String url,
      {Map<String, String>? headers, dynamic body}) async {
    Response response = await http_package.get(Uri.parse(url), headers: headers);
    return HttpResponse(
      rawBody: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Map? body}) async {
    Response response = await http_package.post(Uri.parse(url), headers: headers);
    return HttpResponse(
      rawBody: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponse> put(String url, {headers, body}) async {
    Response response = await http_package.put(Uri.parse(url), headers: headers);
    return HttpResponse(
      rawBody: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }
}