import 'package:flutter/material.dart';

class MyNavigatorPage3 extends StatelessWidget {
  const MyNavigatorPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyNavigatorPage3'),
      ),
      body: Center(
        child: Text('This is my navigator page3'),
        )
      );
  }
}
