
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Widget buildButton(String text, Function callback){
    return GestureDetector(
      child:Text(text),
      onTap: callback()
      );
  }

  Widget buildBody(){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child:Text('Sign up'),
              onTap: (){
                print("SIGN UP");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignUpPage())
                // );
              }
            ),
            buildButton('Sign in', (){
              // SignInPage()
            }),
            buildButton('Reset password', (){
              // PasswordResetPage()
            }),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }
}