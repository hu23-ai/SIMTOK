import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  const ApiClient(this.baseUrl);

  Future<String> analyze(String text) async {
    final res = await http.post(
      Uri.parse('$baseUrl/analyze'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text}),
    );
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      return json['answer'] ?? 'no answer';
    } else {
      throw Exception('HTTP ${res.statusCode}: ${res.body}');
    }
  }
}
