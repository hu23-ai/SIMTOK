import 'package:flutter/material.dart';
import 'package:simtalk/config/server/chat_api.dart'; // 아까 만든 API 연결 파일

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ChatApi _chatApi = ChatApi(); // ✅ ChatApi 인스턴스 생성
  List<Map<String, String>> messages = []; // {"role": "bot"/"user", "text": "내용"}

  void _sendMessage() async {
    final text = _controller.text;
    if (text.isEmpty) return;

    setState(() {
      messages.add({"role": "user", "text": text});
      _controller.clear();
    });

    try {
      // ✅ 인스턴스 메서드 호출
      final response = await _chatApi.sendMessage(text);

      setState(() {
        messages.add({"role": "bot", "text": response});
      });
    } catch (e) {
      setState(() {
        messages.add({"role": "bot", "text": "서버 연결 실패: $e"});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("심리 상담 챗봇")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg["role"] == "user"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msg["role"] == "user"
                          ? Colors.blue[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg["text"] ?? ""),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "답변을 입력하세요...",
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
