import 'package:flutter/material.dart';

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
      home: MyFirstPage(),
    );
  }
}


// 네비게이터란? 그냥 화면이라고 생각해도 크게 틀리지 않는다고 함. 나도 아직 잘 모르겠음.
// 네비게이터 Navigator 는 스택 자료구조라고 생각하면 됨.
// 위에다가 화면 올릴 때는 push 로 올리고, 되돌아갈 때는 pop 으로 꺼내고
// Navigator.push() 할 때는 전달인자 두 개 줘야 함.
// 하나는 context / 다른 하나는 route
// context 를 주는 이유는 위치 정보를 줘야 해서. context 를 전체에서 하나만 쓰는 게 아니고 클래스마다 build 함수에서 context 따로 받아서 쓰는데, 누구 거 받아서 어디로 이동할지 바뀌니까 이런 상대 위치 가지고 움직이는 듯..?
// route 는 다시 builder 속성으로 함수를 넣어줘야 하고, 그 함수는 context 를 인자로 받고, 드디어 이동할 테이지를 return 해줌.

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is my first page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('go to second page'),
          onPressed: (){
            Navigator.push(context2, MaterialPageRoute(
                builder:(BuildContext context){
                  return MySecondPage();
                },
            ));
          },
        ),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is my second page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('go to first page'),
          onPressed: (){
            Navigator.pop(ctx);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ),
      ),
    );
  }
}
