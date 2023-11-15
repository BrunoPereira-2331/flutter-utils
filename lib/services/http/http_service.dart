import 'package:flutter_utils/services/http/http.dart';
import 'package:flutter_utils/services/http/responses/http_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpService extends Http {
  @override
  Future<HttpResponse> delete(String url,
      {Map<String, String>? headers, body}) async {
    Response response =
        await http.delete(Uri.parse(url), headers: headers, body: body);
    return HttpResponse(
      rawBody: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponse> get(String url,
      {Map<String, String>? headers, dynamic body}) async {
    Response response = await http.get(Uri.parse(url), headers: headers);
    return HttpResponse(
      rawBody: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Map? body}) async {
    Response response = await http.post(Uri.parse(url), headers: headers);
    return HttpResponse(
      rawBody: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponse> put(String url, {headers, body}) async {
    Response response = await http.put(Uri.parse(url), headers: headers);
    return HttpResponse(
      rawBody: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }
}
