import 'package:flutter/material.dart';

// dart 에서 먼저 main() 메소드를 찾아서 실행함.
// main() 메소드를 실행하니까 runApp(); 을 실행하라고 함.
// 이 runApp(); 은 flutter 에서 제공해주는 함수임. (package:flutter/src/widgets/binding.dart)
// 안에다가 위젯을 넣어주면 그 위젯을 실행하나 봄.
// 그 안에다 위젯을 넣어줘야 하는데, MyApp() 을 넣어버림.
// MyApp 은 class 고, 실행하면 @override 해 놓은 build() 메소드가 실행함.
// class MyApp 의 build() 메소드가 Widget 을 return 하고, 그 Widget 이 runApp(); 안으로 들어감.
// 그럼 class MyApp 의 build() 메소드를 볼까?
// build() 는 먼저 class MaterialApp 을 return 함.
// MaterialApp 에는 3개 속성을 넣어주고 있음. title/theme/home
// title 은 그냥 문자열 넣어주면 되고, theme 에는 class ThemeData 을 넣어주면 되고,
// 이제 home 이 문젠데, home 에다가 우리가 만든 앱 class Login 을 넣어주고 있음.
// 그리고 class Login 은 밑에 따로 만들어서 구현 중.

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'refactoring login app',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: LoginBefore(),
    );
  }
}

class LoginBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Here My Login App Title',
          style: TextStyle(color: Colors.white),
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              height: 50.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                ),
              ),
              child: ElevatedButton(
                onPressed: (){ print('hello');},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('assets/kakaotalk.png',
                        width: 30.0,
                    ),
                    Text('login button - kakao',
                        style: TextStyle(
                          color:Colors.black87,
                          fontSize: 15.0,
                        )
                    ),
                    Opacity(
                      opacity: 0.0,
                      child: Image.asset('assets/kakaotalk.png',
                          width: 30.0,
                      ),
                    ),
                  ],
                ),
              )
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonTheme(
                height: 50.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: (){ print('hello');},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset('assets/instagram.png',
                          width: 30.0,
                      ),
                      Text('login button - instagram',
                          style: TextStyle(
                            color:Colors.black87,
                            fontSize: 15.0,
                          )
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: Image.asset('assets/instagram.png',
                            width: 30.0,
                        ),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        )
      )
    );
  }

}