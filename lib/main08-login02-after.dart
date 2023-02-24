import 'package:flutter/material.dart';
import 'main08-login03-myLogIn.dart';

void main() {
  runApp(MyApp());
}

// 이 파일을 메인에다가 두고 실행하면 됨.
// 이 파일 'main08-login02-after.dart' 는 'main08-login03-myLogIn.dart' 파일을 import
// 'main08-login03-myLogIn.dart' 파일은 'main08-login04-myButton.dart' 파일을 import
// login-runApp <<== login-after <<== login-myButton

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In By Firebase',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyLogIn(),
    );
  }
}