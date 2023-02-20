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
      home: MyPage(),
    );
  }
}
//
// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          backgroundColor: Colors.amber,
//       // https://api.flutter.dev/flutter/widgets/Container-class.html
//       // Containers with no children try to be as big as possible unless the incoming constraints are unbounded, in which case they try to be as small as possible.
//       // Container 위젯은 children 이 아무 것도 없을 때는 최대 크기를 가져간다. default 가 100%
//       body: Container(
//         color:Colors.red,
//         // Containers with children size themselves to their children.
//         // Container 위젯은 children 이 있을 때 크기가 children 크기만큼으로 바뀐다.
//         // Container 위젯 안에 child 가 없을 때는 화면 전체를 차지하다가 child 가 들어가는 순간 Container 크기가 딱 그 child 만 감싸는 크기로 바뀜.
//         child: Text('this is Container text'),
//       )
//     );
//   }
// }

// emulator 에서 앱 요소들의 border line 보여주기 기능
// flutter inspector 켜서 우측 상단에 설정 아이콘 모음 있음.  거기 있는 아이콘 버튼들 중에 guideline 어쩌구 클릭하면 됨. 다른 버튼들도 유용한 기능.
// 위에서 body: Container 부분에서 Container 위젯을 SafeArea 위젯으로 감싸기 ( android studio 라면 단축키 alt + enter )


class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          // Container 위젯은 child 를 하나만 가질 수 있음.
          // child 를 하나만 가지는 single child widget (ex- Container)  / 여러 개 가지는 multi child widget (ex- Column, Row)
          child: Text('this is Container text'),
          color:Colors.red,
          width: 100,
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 80,horizontal: 20),  //  Container 바깥쪽으로 여백 둠
          padding: EdgeInsets.all(20),  // Container 안쪽으로 여백 둠
        ),
      ),
    );
  }
}