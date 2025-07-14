import 'package:flutter/material.dart';
import 'package:simtalk/page/historychat_page.dart';
import 'chatting_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SimTalk'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100, width: 100,
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: ElevatedButton(
                child : Text('목록'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistorychatPage()));
                },
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 100, width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: ElevatedButton(
                  child : Text('채팅'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChattingPage()));
                  },
              ),
            ),
          ],

        ),
      ),

    );
  }
}
