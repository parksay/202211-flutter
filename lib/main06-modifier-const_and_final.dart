import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Game',
      home: Container(),
    );
  }
}

// const 와 final
// const/final/public/private/... 이런 수식어를 제어자 (modifier) 라고 함 ex) public/private... 는 "접근 제어자"
// const 와 final 의 공통점: 변수를 처음에 한 번만 초기화할 수 있고 그 이후로는 변경할 수 없다는 첨.
// const 와 final 의 차이점: 어느 시점에 변수 안에 값을 넣어주는지.
// final = run-time constant  => 실행하는 시점에 초기화가 이루어짐
// const = compile-time constant  => 컴파일하는 시점에 이미 초기화돼 있어야 함
//    > const time = DateTime.now(); // => 이러면 에러남. 컴파일 하려고 봤는데 애가 변수 안에 뭐 값이 들어 있는 게 아니라서
//    > final time = DateTime.now(); // => 이렇게 하면 에러 사라짐
// final 제어자에 대해서, 아래 예시를 보자
class Question extends StatelessWidget {
  final String question;
  Question(this.question);

  @override
  Widget build(BuildContext context) {
      return Container(
        child: ElevatedButton(
          child: Text(question),
          onPressed: () {
            print(question);
          },
        )
      );
  }
}

// Question 이라는 클래스 안을 뜯어 보자.
// String question; 라고 내부 변수 "question" 을 선언하고 있음.
// 대신 "question" 변수 앞에는 final 이 붙어 있음.
// 사실 이 "final" 제어자는 Java 언어에서도 자주 보던 것.
// 잠깐 Java 를 떠올려 보면, Java 에서는 "final" 이 붙은 변수에 값을 넣어주는 방법이 2가지가 있었지.
// 하나는 선언하면서 바로 넣어주기, 다른 하나는 생성자(constructor)에서 받으면서 바로 넣어주기.
// dart 언어에서도 Java 와 마찬가지로 "final" 변수에 값을 넣어주는 방법은 이 두 가지 방법뿐임.
// 자, 다시 위의 예시 class Question 로 돌아와 보자.
// 내부 변수 "question" 을 "final" 로 선언해 놓고는 아무 값도 넣어주지 않았어.
// 대신 Question(this.question); 하면서 Question() 이라는 생성자 constructor 메소드에서 파라미터로 받아서 바로 넣어주고 있지.
// 그럼 이제 "question" 변수는 초가화가 완료되었고, 그 안에는 어떤 값이 들어 있을 거야.
// 그래서 아래에서처럼 "question" 변수를 가져다가 사용할 수 있음.
//    > child: ElevatedButton(
//          > child: Text(question),
// 근데 우리가 눈여겨 봐야 할 부분은 "question" 변수 안에 값이 들어가는 시점이야.
// 우리가 지금 이 코드를 짜고 있는 이 순간에도, 어떤 값이 들어갈지 몰라.
// 그럼 언제 알 수 있어? 사용자가 질문 목록에서 어떤 질문을 클릭했을 때,
// 어떤 질문을 클릭했는지 그 정보를 받아다가 class Question 을 생성하면서,
// 생성자 constructor 가 실핼되는 시점이야.
// 생성자 constructor 에서 "question" 에다가 값을 넣어주고 있으니까.
// 즉, 앱이 이제 디바이스에 올라가고, 실행되고 있고, 그 시점에도 "question" 안에는 뭐가 들어갈지 아무도 모르고,
// 사용자가 어떤 동작을 하고 어떤 로직을 타게 되면서 그때서야 비로소 "question" 변수 안에 값이 들어가.
// 이게 바로 실행 시점 상수, run-time constant 의 의미임.


// 이번엔 그런 "const" 제어자는 어떻게 사용하는지?
// 그냥 컴파일 하는 시점에서 어떤 값이 들어가 있는지 바로 알 수 있어야 함.
// 우리가 코딩하고 있는 이 시점에도 값을 딱 알 수 있다는 뜻이지.
//예를 들어서 const var mathPi = 3.14159265358979....;
//수학에서 쓰는 '파이'가 무슨 이 상황에서는 이런 값이고, 저 상황에서는 저 값이고,
//이 유저가 쓰면 이 값이고, 저 유가가 쓸 때는 저 값이고,
//이 앱에서는 이 값이고, 저 앱에서는 저 값이고, 그러나?
//그러지 않잖아. 그냥 고정임. 그런 거에는 const 쓰면 됨.
//한 사람당 최대로 선택할 수 있는 카테고리 갯수, 총 3개임. 변하지 않아. 이런 거 const
//최대로 입력할 수 있는 글자 길이, 한 번에 보여줄 수 있는 UI 요소 갯수, 등등...
//이렇게 컴파일 시점에는 이미 값이 들어가 있고 우리도 알고 있는 값들은 const

// "private" 제어자 만들려면 변수 이름 앞에 _ 언더바 쓰면 됨.
// dart 에서는 명시적으로 안 붙여도 그렇게 해주나 봄...
// 이게 좋은 걸까...? 관습으로 남겨두고 명시적으로 붙여주는 편이 더 좋은 걸까?
// "private" 라는 '접근 제어자'는 같은 파일 안에서만 접근 가능함.
// 다른 파일이나 로직에서 쉽게 이 변수에 접근해서 함부로 값을 변경하거나 그런 사태 방지