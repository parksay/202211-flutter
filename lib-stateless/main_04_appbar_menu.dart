import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello My App',
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
        title: Text('My App Bar'),
        // title 을 중앙 정렬
        centerTitle: true,
        elevation: 0.0,
        // 가장 앞쪽에 먼저 배치할 요소들
        leading: IconButton(
          icon:Icon(Icons.menu),
          // IconButton 은 'onPressed' 라는 파라미터를 꼭 넣어줘야 함. 버튼 클릭했을 때 동작임.
          onPressed: (){
            print('button menu is clicked');
          },
        ),
        // actions는 AppBar 위젯에 넣어주는 파라미터. AppBar의 'title' 요소 뒤에 나오늘 요소들
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.shopping_cart),
            // IconButton 은 'onPressed' 라는 파라미터를 꼭 넣어줘야 함. 버튼 클릭했을 때 동작임.
            onPressed: (){
              print('button shopping_cart is clicked');
            },
          ),
          IconButton(
            icon:Icon(Icons.search),
            // IconButton 은 'onPressed' 라는 파라미터를 꼭 넣어줘야 함. 버튼 클릭했을 때 동작임.
            onPressed: (){
              print('button search is clicked');
            },
          ),
        ],
      ),

    );
  }
}
