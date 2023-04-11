import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyKey(),
    );
  }
}

// GlobalKey 는 <> generic 타입으로 어떤 클래스를 bind 함.
// 그러면 이제 GlobalKey 를 통해서 그 클래스에 접근할 수 있게 됨.
// 외부에서 어떤 클래스에 접근하는 게 가능해진다는 뜻.
// 그 클래스의 멤버 함수도 불러다 쓸 수 있고 멤버 변수에도 접근할 수가 있음.
// 아래 기능은 화면에서 숫자 하나를 state 로 들고 있고, 버튼 클릭하면 그 숫자가 증가하는 기능.
// 상위 페이지에서는 클래스 변수로 GlobalKey 하나 만들어 두고 state 클래스에 bind 해 둠.
// state 클래스는 숫자 정보를 들고 있음.
// 또 state 클래스에는 숫자를 증가시키는 함수도 있음.
// 상위 페이지에서는 하위 페이지 Counter 라는 위젯 따로 만들어서 부르고 있음
// 하위 페이지 Counter 는 state 클래스를 따로 들고 있고.
// 상위 페이지에서 버큰을 클릭하면 글로벌 키에 bind 해 둔 하위 페이지의 state 클래스에 직접 접근함.
// state 클래스에 직접 접근해서 숫자들 바꿈.

class MyKey extends StatelessWidget {
  // const MyKey({Key? key}) : super(key: key);   //  => 삭제
  final counterKey = GlobalKey<_CounterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global key'),
      ),
      body: Center(
        child: Counter(
          key: counterKey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          counterKey.currentState!.increment();
          print(counterKey.currentState!.count);
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("current count = $count",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
