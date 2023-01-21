import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello My Snack Bar',
      theme: ThemeData(
          primarySwatch: Colors.red
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
        title: Text('Here is My New Snack Bar'),
        // title 을 중앙 정렬
        centerTitle: true,
      ),
      body: MySnackBar(),
    );
  }
}


class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('click here'),
        onPressed: () {
          // Scaffold.of(context).showSnackBar(SnackBar(content: Text('This is your message'),),);  // 원래 쓰던 게 이거였는데 추후 업데이트에서 deprecated 되면서 아래처럼 씀.
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('This is new snack bar msg2',
                      textAlign: TextAlign.center,
                      style: TextStyle(color:Colors.white),
                    ),
                  backgroundColor: Colors.teal,
                  duration: Duration(milliseconds: 1000),
              ));
        },
      ),
    );
  }
}
