import 'responses/http_response.dart';

abstract class HttpInterface {

  Future<HttpResponse> delete(String url, {Map<String, String>? headers, dynamic body});
  Future<HttpResponse> get(String url, {Map<String, String>? headers, dynamic body}); 
  Future<HttpResponse> post(String url, {Map<String, String>? headers, Map<dynamic, dynamic>? body}); 
  Future<HttpResponse> put(String url, {dynamic headers, dynamic body});



}