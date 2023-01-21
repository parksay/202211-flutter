import 'package:flutter/material.dart';

class MyNavigatorPage2 extends StatelessWidget {
  const MyNavigatorPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ElevatedButton(
                onPressed: (){
                  // Navigator.pushNamed(context, routeName);
                  Navigator.pushNamed(context, '/page3');
                },
                child: Text('go to page3'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            ),
          ],
        )
      )
    );
  }
}
