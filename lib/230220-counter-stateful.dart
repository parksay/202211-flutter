import 'package:first_app/230220-counter-stateless.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}

class MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You have pushed the button below times: "),
              Text("$counter", style: Theme.of(context).textTheme.displaySmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    child: Icon(Icons.remove),
                    onPressed: (){
                      setState(() {
                        counter--;
                        print("$counter");
                      });
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: (){
                      setState(() {
                        counter++;
                        print("$counter");
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
              setState(() {
                counter = 0;
                print("$counter");
              });
          },
        ),
      ),
    );
  }


}

// -- stateful widget --
// stateful widget 안에는 state 라는 class 가 포함돼 있는 것.
// 그리고 build method 를 들고 있는 건 바로 이 state class 임.
// stateful widget 이 다시 rendering 되는 요인
// >  1) child widget 의 생성자를 통해서 data 가 전달될 때
// >  2) internal state 가 바뀔 때
//
// -- StatelessWidget 의 build method --
// 아래 extends StatelessWidget 에서 ctrl 키 누르면서 StatelessWidget 를 클릭해 봐.
// class MyApp extends StatelessWidget {
// 그러고 아래로 스크롤 내려 보면 build() method 가 있음.
// @protected
// Widget build(BuildContext context);
// 즉, 우리가 여태까지 override 해서 쓰던 build() method 는 StatelessWidget 에서 받아온 것.
// @override
//   Widget build(BuildContext context) {
//      return MaterialApp( ....
//
// -- StatelessWidget 를 StatefulWidget 으로 바꾸기 --
// class MyApp extends StatelessWidget {
// extends 하던 class 를 위처럼 StatelessWidget 로부터 아래처럼 StatefulWidget 로 바꾸기
// class MyApp extends StatefulWidget {
// StatelessWidget 는 class 가 두 개로 이루어져 있음
// 하나는 Widget 이고, 다른 하나는 State
// 그래서 statefulWidget 하나 만들려면 class 도 두 개를 만들어야 함.
// 먼저 MyApp 하나 있고, 그 이름 뒤에 State 를 붙여서 MyAppState 이렇게 해서 만드는 게 관습
// 왜 이렇게..? Widget class 는 immutable 하기 때문에 바뀌지 않음.
// 그래서 얘는 가만히 두되, 상태 변화를 반영해줄 수 있는 state class 가 하나 더 필요하게 됨.
// 그럼 이 Widget 이랑 State 랑 두 클래스를 이어줄 수 있을까?
// State class 안을 열어보면 아래 코드가 있음 (ctrl + 클릭)
// @optionalTypeArgs
// abstract class State<T extends StatefulWidget> with Diagnosticable {
// 즉 State class 는 generic 타입이고, 그 타입은 StatefulWidget 를 상속받음.
// StatefulWidget 를 상속 받는 class 를 넣어줘서 그 class 의 state 를 관리하는 State class 가 탄생함.
// MyApp class 에서는 createState() method 를 만들어서 State<StatefulWidget> 를 return 해줘야 함.
// MyAppState 의 type 이 뭐였음? "State<MyApp>" return 값으로 딱이지 ( class MyAppState extends State<MyApp> )
// 이렇게 해서 돌려봤는데 숫자가 실시간으로 증가하지 않음.
// 이유는 Text() widget 자체가 stateless 이기 때문.
// setState() method 를 호출해야 함.
// setState 의 역할은 두 가지. 1) 전달인자로 받고 있는 함수들을 호출하는 것 2) build() method 를 호출하는 것.
// floatingActionButton: FloatingActionButton(
//           onPressed: (){
//               setState(() {
//                 counter++;
//               });
//           },
//        ), // FloatingActionButton
// 버튼 클릭 > button 의 onPressed 실행 > setState() 실행 > counter 변수 증가 + counter 변수를 사용하고 있는 widget 들한테 build 다시 하라고 호출