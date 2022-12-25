import 'package:first_app/main_01_basic.dart';
import 'package:flutter/material.dart';

// dart 언어에서는 컴파일러가 자동으로 main() 함수를 찾아서 실행함
// java도 똑같지. main() 이 가장 먼저 실행됨.
void main() => runApp(MyApp());
// runApp 은 dart 언어가 아니라 flutter 프레임워크에서 제공하는 함수임.
// runApp 은 parameter 로 class 하나를 넣어줘야 함.

// 함수 이름은 소문자로 시작
// 클래스 이름은 대문자로 시작
// stateless 의 자음 stl 를 치면 자동 완성
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'hello world',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
  // 플러터는 위젯 트리가 중요한데 계층이 복잡하기 때문에 닫는 괄호에서 어떤 위젯을 닫는 괄호인지 자동으로 각주 달아주는 기능이 있음
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold 는 발판, 바탕 이런 뜻. 도화지라고 생각하면 될 듯
    return Scaffold(
      // appbar 는 상단. 앱은 보통 세 가지 구조로 이루어져 있는데, 머리/가슴/배처럼 상단/중단/하단 이렇게 나눔. 상단이 appBar/중단이 body/하단이 footer
      appBar: AppBar(
        title: Text('here appBar title'),
        // appbar 에 들어 있는 text를 가운데 정렬 => centerTitle
        centerTitle: true,
        // appbar 배경 색상 => backgroundColor
        backgroundColor: Colors.redAccent,
        // appbar 입체 효과, 그림자 효과, 붕 떠 있는 효과 => elevation
        elevation: 0.0,
      ),
      // 앞에서 앱은 세 구조 상단/중단/하단, 즉 appbar / body / footer 로 이루어져 있다고 했지. 그 중에서 지금 body 가 나온 거
      // Center 는 좌우를 기준으로 중앙에 정렬
      body: Center(
        // Column 은 다른 요소들은 세로로 나열할 수 있도록 만들어 주는 위젯
        child: Column(
          // Column 은 세로로 나열하도록 만들어 준 거고, mainAxisAlignment 는 그 세로 안에서 기준점을 잡아줌. 상단, 중단, 하단 등
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello'),
            Text('Big'),
            Text('World'),
          ],
        ),
      ),
    );
  }
}


/*
body: Padding(
        // fromLTRB 는 left/top/right/bottom 순서로 패딩 값 지정
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        // Column 은 다른 요소들은 세로로 나열할 수 있도록 만들어 주는 위젯
        child: Column(
          // Column 은 세로로 나열하도록 만들어 준 거고, mainAxisAlignment 는 그 기준점을 잡아줌. 상단, 중단, 하단 등
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello'),
            Text('Big'),
            Text('World'),
          ],
        ),
      ),
 */