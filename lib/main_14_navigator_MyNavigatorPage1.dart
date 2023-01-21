import 'package:flutter/material.dart';

class MyNavigatorPage1 extends StatelessWidget {
  const MyNavigatorPage1({Key? key}) : super(key: key);

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
                  Navigator.pushNamed(context, '/page2');
                },
                child: Text('go to page1'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/page3');
                // 그냥 Navigator.push(); 이렇게 부를 때는 아래처럼 썼었지.
                // Navigator.push(context2, MaterialPageRoute(
                //   builder:(BuildContext context){
                //     return MySecondPage();
                //   },
                // ));
              },
              child: Text('go to page2'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
          ],

        )
      )
    );
  }
}
