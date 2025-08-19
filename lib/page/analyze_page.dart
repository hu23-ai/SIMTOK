import 'package:flutter/material.dart';
import 'package:simtalk/config/server/api_client.dart';
import 'package:http/http.dart';


class AnalyzePage extends StatefulWidget {
  final ApiClient api;
  const AnalyzePage({super.key, required this.api});
  @override
  State<AnalyzePage> createState() => _AnalyzePageState();
}

class _AnalyzePageState extends State<AnalyzePage> {
  final _ctrl = TextEditingController();
  String? _answer;

  Future<void> _send() async {
    final ans = await widget.api.analyze(_ctrl.text);
    setState(() => _answer = ans);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('심톡')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _ctrl),
            ElevatedButton(onPressed: _send, child: const Text('분석')),
            if (_answer != null) Text(_answer!),
          ],
        ),
      ),
    );
  }
}
