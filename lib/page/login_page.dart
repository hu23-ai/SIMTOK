import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:simtalk/main.dart';
import 'package:simtalk/page/home_page.dart';
import 'package:simtalk/page/register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController userIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String userID = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible){
      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          elevation: 0.0,
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                Center(
                  child: Image(
                    image: AssetImage('assets/img/test_image.png'),
                    width: 170.0,
                  ),
                ),
                Form(
                    child: Theme(
                        data: ThemeData(
                          primaryColor: Colors.grey,
                          inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0))),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Builder(builder: (context){
                            return Column(
                              children: [
                                TextField(
                                  controller: userIDController,
                                  autofocus: true,
                                  decoration: InputDecoration(labelText: 'Enter ID'),
                                  keyboardType: TextInputType.text,
                                ),
                                TextField(
                                  controller: passwordController,
                                  autofocus: true,
                                  decoration: InputDecoration(labelText: 'Enter password'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true, // 비밀번호 안보이도록
                                ),
                                SizedBox(height: 40.0,),
                                ButtonTheme(
                                    child: ElevatedButton(
                                        onPressed: (){
                                          if (userIDController.text == 'no123' && passwordController.text == '1234'){
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext context)=> HomeScreen()));
                                          }

                                        },
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey
                                      ),
                                    )),
                                if (!isKeyboardVisible) SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        '계정이 아직 없으신가요?',
                                        style: TextStyle(color: Colors.black45)
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.blueGrey, width: 0.8))),
                                        child: Text(
                                            '회원가입',
                                            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600, height: 0)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                        )))
              ],
            ),
          ),
        ),
      );
   });
  }


}


