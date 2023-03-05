import 'package:flutter/material.dart';
import 'main18-weather02-loading.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Loading(),
    );
  }
}

// API 란?
// Application Programming Interface
// 응용 프로그램에서 사용할 수 있도록
// 운영 체제나 프로그래밍 언어가 제공하는 기능을
// 제어할 수 있게 만든 인터페이스를 말한다.
// 이게 뭔 말임...?
// 1. 표준화되어 있는 명령어나 기능.
// 그니까 '이런 방식으로 쓰시면 기능 기능이 돼요~' 하고 미리 만들어 둔 결과물을
// 그 사람이 정해 놓은 대로 갖다 쓰기만 하면 되는 명령어나 기능
// 2. 매개 역할자
// 외부 시스템과 데이터를 주고 받을 때 중간 문지기 같은 느낌?
// 은행에 내 계좌가 있고, 나는 그 계좌에 접근해서 내 돈을 꺼내오고 싶고,
// 그러면 은행원한테 가서 그 계좌 주인이 나라는 걸 증명한 뒤에, 그 계좌을 대상으로 어떤 작업을 하겠지.
// 그 중간에서 은행원 역할을 하는 게 API