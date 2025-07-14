import 'package:flutter/material.dart';


class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatting"),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 100, width: 200,
              decoration: BoxDecoration(
                  color: Colors.blueAccent
              ),
            ),
          ],
        ),
      ),
    );
  }
}
