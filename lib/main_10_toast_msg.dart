import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello My Snack Bar',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here is My Taoast Message'),
        // title 을 중앙 정렬
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: (){ showMyToastMsg(); },
          child: Text('Cilck Here'),
        ),
      ),
    );
  }
}


void showMyToastMsg() {
  Fluttertoast.showToast(
    msg: 'This is my toast msg',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
    fontSize: 20.0,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}