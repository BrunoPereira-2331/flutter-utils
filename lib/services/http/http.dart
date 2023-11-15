abstract class Http {

  Future<dynamic> delete(String url, {Map<String, String>? headers, dynamic body});
  Future<dynamic> get(String url, {Map<String, String>? headers, dynamic body}); 
  Future<dynamic> post(String url, {Map<String, String>? headers, Map<dynamic, dynamic>? body}); 
  Future<dynamic> put(String url, {dynamic headers, dynamic body});



}