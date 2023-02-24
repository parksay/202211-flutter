import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Game',
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Log in here'),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('hello world1');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('hello world2');
              },
            ),
          ],
        ),
      // SingleChildScrollView: 화면 보고 있다가 키보드 입력창이 밑에서 밀고 올라 왔을 때 기존에 보던 화면 영역을 침범함.
      // 이 문제를 해결하기 위해서 SingleChildScrollView widget 으로 한 번 감싸줌.
      // 원래는 body: Column(child: ...) 하고 바로 시작했음.
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50)),
            Center(
              child: Image(
                image:AssetImage('assets/assets_login/chef.gif'),
                width: 170.0,
                height: 190.0,
              ),
            ),
            Form(
                child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: <Widget>[
                            // TextField: 텍스트를 입력할 수 있는 빈칸 생성 widget
                            // TextField > decoration: 입력 칸을 꾸며주기
                            // TextField > keyboardType: 모바일에서 어떤 키보드 띄울지? "@" 입력할 수 있는 email 키보드? "/"나 "." 있는 url 입력 키보드? 숫자 가득한 날짜 입력 키보드? 그냥 단순 텍스트 키보드?
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter "email"',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            // TextField > obscureText: 비밀번호 같은 거 입력할 때 안 보이게 가림.
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter "password"',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                                ),
                                child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                ),
                                onPressed: () { print('hello world3'); },
                              ),
                            ),
                          ],
                        ),
                    )),
            ),
          ],
        ),
      )

    );
  }
}
