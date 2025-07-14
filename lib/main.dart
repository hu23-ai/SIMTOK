import 'package:flutter/material.dart';
import 'package:simtalk/page/home_page.dart';
import 'package:simtalk/page/login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMTALK',
      theme: ThemeData(
        primaryColor:Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
