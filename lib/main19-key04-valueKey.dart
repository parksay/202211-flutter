import 'package:flutter/material.dart';
import 'package:first_app/main05-login04-dice01-stateless.dart';

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

// 이전에 만들었던 페이지 재활용하기
// 예를 들어서 email 과 password 를 입력하는 페이지가 있어
// 둘은 똑같이 TextField 위젯으로 되어 있겠지
// 이 상황에서 예를 들어서 어떤 상태에 따라서 TextField 위젯 하나를 보여주거나 말거나 해야 하는 상황이야
// TextField 위젯 둘 모두에 값을 입력해 놓은 상태에서 한 쪽을 갑자기 사라지게 해 봐.
// 그럼 TextField 위젯이 하나는 사라지고 한 쪽만 남게 되면서 TextField 안에 입력해 놨던 값들이 꼬이게 돼
// 사라지게 했던 TextField 위젯을 다시 살려서 둘 모두가 보이게 되면 또 꼬이고.
// TextField 안에 값을 입력했다면, 이 입력한 값 자체가 state 가 되는 것
// TextField 가 두 개 였는데 그 안에 값을 입력한 건 state 가 들고 있고,
// 그 상태에서 한 쪽을 사라지게 하면 state 도 따라서 사라지는 게 아니라 그거만 남아서 값을 꼬이게 함.
// 이러한 현상이 일어나는 이유는, 앞에서 배웠듯이, state 는 기본적으로 class 만 가지고 판단하기 때문.
// 이럴 때 필요한 게 바로 ValueKey
// // key 넣어주기 전
// TextField(
// decoration: InputDecoration(
// labelText: 'Enter "email"',
// ),
// keyboardType: TextInputType.emailAddress,
// ),
// ================================================
// // key 넣어준 후
// TextField(
// decoration: InputDecoration(
// labelText: 'Enter "email"',
// ),
// keyboardType: TextInputType.emailAddress,
// key: ValueKey(1),
// ),

class _LoginState extends State<Login> {


  // email 입력 폼을 보여줄지 말지 결정하는 변수
  bool emailField = true;

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
        body: Builder(
          builder:(context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
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
                              // emailField 변수 값이 true 일 때만 바로 다음 위젯 TextField 를 출력함. false 라면 안 나옴.
                              if(emailField)
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter "email"',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                // key: ValueKey(1),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter "password"',
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                // key: ValueKey(2),
                              ),
                              SizedBox(height: 40,),
                              ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    minimumSize: Size(150,50),
                                  ),
                                  child: Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      emailField = !emailField;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


