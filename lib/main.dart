import 'package:flutter/material.dart';
import 'package:simtalk/config/server/api_client.dart';
import 'package:simtalk/page/analyze_page.dart';
import 'package:simtalk/page/home_page.dart';
import 'package:simtalk/page/login_page.dart';
import 'package:http/http.dart';

void main(){
  const api = ApiClient('http://127.0.0.1:3000');
  runApp(MyApp(api: api));
}

class MyApp extends StatelessWidget {
  final ApiClient api;
  const MyApp({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMTALK',
      theme: ThemeData(
        primaryColor:Colors.blue,
      ),
      home:
      HomeScreen(),
    );
  }
}
