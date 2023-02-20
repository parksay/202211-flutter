import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('My Character Info'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          // Column 위젯에서 mainAxisAlignment 속성은 세로 시작점 기준을 잡는 거고 crossAxisAlignment는 가로축 시작점 기준을 잡는 거
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hello',
              // Text 위젯에 style 주기 > TextStyle 이라는 위젯을 파라미터로 넣어줌
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            // 크기가 있는 박스를 넣음. 여기서는 그냥 빈 박스를 넣을 건데 높이 조절하려고 그런 거
            SizedBox(
              height: 10.0,
            ),
            Text('PotatoMan',
            style: TextStyle(
              color: Colors.white,
              // 자간
              letterSpacing: 2.0,
              // 크기
              fontSize: 28.0,
              // 굵기
              fontWeight: FontWeight.bold
            )),
          ],
        ),
      ),

    );
  }
}


/*
class Person{
  int age;
  String name;

  Person(this.name, {this.age = 29});
}


void main() {
  Person p1 = new Person("myName", hello: 'world');

  print(p1.name);
  print(p1.age);
  print("hello world");
}

dart 에서는 파라미터를 두 종류로 줄 수가 있음.
하나는 positional parameter
다른 하나는 named parameter
두 파라미터 종류의 차이는 구별하는 방식.
positional parameter 는 순서로 파라미터들을 구별함.
positional parameter는 순서를 잘 지켜서 줘야 함.
constructor() 가 받아주는 순서대로 instance 만들 때 넣어줘야 함.
하나라도 더 주거나 덜 주면 에러가 남.
named parameter 는 이름으로 파라미터들을 구별함.
constructor({named:'parameter'}) 처럼 중괄호로 묶어줌.
이는 key:value 처럼 이름으로 구별하는 파라미터임.
순서는 상관 없음.
대신 들어와야하는 key로 parameter를 안 넣어주거나
받아주는 key 가 없는 parameter 를 넣어주면 에러감.





*/