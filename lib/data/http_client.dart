import 'package:http/http.dart' as http;

class HttpClient {
  Future<String> get(url, {Map<String, String> headers}) async {
    try {
      final response = await http.get(url, headers: headers);
      return Future.value(response.body);
    } catch (error) {
      throw error;
    }
  }
}
