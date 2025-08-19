import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatApi {
  final String baseUrl = "http://127.0.0.1:8000"; // 서버 주소

  Future<String> sendMessage(String userMessage) async {
    final response = await http.post(
      Uri.parse('$baseUrl/chat'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"message": userMessage}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['reply']; // 서버에서 주는 답변 텍스트
    } else {
      throw Exception("Failed to connect to server");
    }
  }
}
