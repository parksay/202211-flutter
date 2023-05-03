import 'package:flutter/material.dart';
import 'main20-chat02-login_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  // firebase 쓰려면 Firebase.initializeApp() 을 항상 먼저 실행해 줘야 함.
  // 근데 그러려면 flutter 바탕 App 이 먼저 초기화되어 있어야 함.
  // firebase 는 flutter app 이랑 연동하려고 하는데 flutter app 쪽이 먼저 올라가 있지 않으면 실패하기 때문
  // 그래서 Firebase.initializeApp() 를 부르기 전에는 먼저 WidgetsFlutterBinding.ensureInitialized() 를 부름.
  // app 이 먼저 올라가 있는지 확실하게 하고 나서 firebase 실행함.
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chatting App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginSignupScreen(),
    );
  }
}
