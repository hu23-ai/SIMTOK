import 'package:flutter/material.dart';

class HistorychatPage extends StatelessWidget {
  const HistorychatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History Chat"),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
