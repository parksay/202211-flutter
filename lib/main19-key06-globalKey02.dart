import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

final rootScaffoldKey = GlobalKey<ScaffoldMessengerState>();

// 우리가 snack bar 띄울 때 이런 구문 썼었지
// ScaffoldMessenger.of(context).showSnackBar( ... );
// 여기서 ScaffoldMessenger 를 까 보면 안에 이렇게 선언되어 있어.
// class ScaffoldMessenger extends StatefulWidget { ... }
// 즉, ScaffoldMessenger 는 stateful 위젯이고, state 클래스를 갖는다는 뜻.
// 한편 MaterialApp 도 한번 살펴볼게.
// MaterialApp() 안에 들어가서 생성자를 살펴보면 아래 구문이 있음
// const MaterialApp({ ... , this.scaffoldMessengerKey, ... });
// 생성자로 scaffoldMessengerKey 를 받는다는 뜻.
// 자 이제 감이 오지.
// GlobalKey<> 를 하나 만들면서 그 안에 어떤 State 랑 bind 할 거냐면 ScaffoldMessengerState 랑 bind 해둘 거야.
// 그렇게 생성한 ScaffoldMessengerState 의 global key 를 MaterialApp() 생성자에 넣어주기.
// 그럼 이제 ScaffoldMessenger 를 MaterialApp() 단위에서 들고 있기 때문에 페이지를 옮겨 다녀도 사라지지 않고 snack bar 가 떠 있음.


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldKey,
      theme: ThemeData(primarySwatch: Colors.blue),
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
        title: Text("Scaffold Messenger Test"),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: () {
          rootScaffoldKey.currentState!.showSnackBar(
            SnackBar(
              content: Text("This is my new snack bar"),
              duration: Duration(seconds: 5),
              action: SnackBarAction(
                label: 'undo',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=> ThirdPage()
                      ),
                  );
                },
              )
            ),
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Go to the second page"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=> SecondPage()
            ),
          );
        },
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text(
          '"좋아요가 추가 되었습니다"',
          style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
        ),
      ),
    );
  }
}


class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"좋아요"를 취소 하시겠습니까?',
                  style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('"좋아요"가 취소되었습니다'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                  child: Text('취소하기'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}