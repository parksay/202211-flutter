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
        title: Text('Here is My Snack Bar'),
        // title 을 중앙 정렬
        centerTitle: true,
      ),
      // context 를 여기에서 던져주니까 onPressed 에 들어 있는 ctx 는 Center 에서 들고 있고, Center 에서 들고 있는 ctx 는 Builder 가 들고 있으므로 상위로 가면서 Scaffold 찾으면 root 바로 아래 Scaffold 가 나옴
      body: Builder( builder: (BuildContext ctx) {
        return Center(
          // 다음 세 버튼은 자주 쓰이는데 모양은 조금 다르지만 기능상으로는 큰 차이는 없음 : RaisedButton / FloatingActionButton / FlatButton (Flutter 가 업데이트되면서 FlatButton 은 TetxtButton 으로, RaisedButton 은 ElevatedButton 이름이 바뀜)
          child: TextButton(
            // TextButton > chile - 버튼에는 필수로 (텍스트 + 눌렀을 때 동작)
            child: Text('click here2',
              // text 에 스타일 주기
              style: TextStyle(
                  // 텍스트 색상은 하얀색
                  color: Colors.white
              ),
            ),
            // TextButton > onPressed - 버튼에는 필수로 (텍스트 + 눌렀을 때 동작)
            onPressed: (){
              print('button clicked');
                          // Scaffold.of(context).showSnackBar(SnackBar(content: Text('This is your message'),),);  // 원래 쓰던 게 이거였는데 추후 업데이트에서 deprecated 되면서 아래처럼 씀.
                          ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('This is your message2'),),);  //
            },
            // TextButton > style - 버튼에 스탕일 주기
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
          ),
        );
      }),
    );
  }
}


