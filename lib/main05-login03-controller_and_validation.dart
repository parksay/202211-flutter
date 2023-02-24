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

class _LoginState extends State<Login> {

  // Form 에서 사용자가 이메일이나 패스워드를 입력했어.
  // 우리는 그럼 사용자가 입력한 값을 받아와서 validation 도 하고 server 로 보내기도 하고 해야 하잖아.
  // 그럼 값을 받아오는 건 어떻게 하는가? 바로 그 기능을 하는 게 TextEditingController
  // 사용법 1) 값을 받아오고 싶은 항목 입력칸 widget ex) TextFeild 안에다가 controller 속성으로 여기서 만든 controller 객체를 꼽사리로 넣어줌.
  // 사용법 2) 갖다 쓰고 싶은 곳에서 controller1.text 이런 식으로 불러다가 씀.
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();


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
      body: Builder(
        builder:(context) {
          return SingleChildScrollView(
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
                            // TextField > controller: 이 입력 칸에다가 사용자가 입력한 값을 받아와서 validation 을 하든 server 로 보내든, 처리해야 할 거잖아. 그때 사용자가 입력한 값을 받아오는 기능을 하는 게 controller
                            TextField(
                              controller: controller1,
                              decoration: InputDecoration(
                                labelText: 'Enter "email"',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            // TextField > obscureText: 비밀번호 같은 거 입력할 때 안 보이게 가림.
                            TextField(
                              controller: controller2,
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
                                onPressed: () {
                                  // TextField 에다가 넣어뒀던 controller 에서 사용자 입력값을 꺼내서 쓸 때
                                  if(controller1.text.length > 5) {
                                    print('email 은 5자 이하로 입력해주세요');
                                    showSnackBar1(context);
                                    return;
                                  }
                                  if(controller2.text.length < 5) {
                                    print('password 은 5자 이상으로 입력해주세요');
                                    showSnackBar2(context);
                                    return;
                                  }
                                  print('hello world3');
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Dice(),),);
                                },
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          );
        },
      )

    );
  }
}

void showSnackBar1(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 2),
      content: Text('아이디는 5자 이하로 입력해주세요', textAlign: TextAlign.center, ),
    ),
  );  //
}
void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 2),
      content: Text('비밀번호는 5자 이상으로 입력해주세요', textAlign: TextAlign.center, ),
    ),
  );  //
}
void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 2),
      content: Text('This is your message2', textAlign: TextAlign.center, ),
    ),
  );  //
}


// Focus 에 대해서 알아보자
// FocusNode: Focus 를 받고 있는 특정한 위젯을 식별함
// FocusScope: 이 특정한 위젯이 Focus 를 받고 있을 때, 어느 위젯부터 어느 위젯들까지 Focus 판정을 받는지 그 범위를 나타냄.
// FocusTree: 이건 뭘까?
// FocusScope.of(context) 메소드를 쓰면 지금 focus 받고 있는 focusNode 를 찾아올 수 있음.
// FocusNode.unfocus() 메소드를 쓰면 지금 받고 있는 focus 를 해제할 수 있음.
// 그 둘을 이어붙이면 FocusScope.of(context).unfocus();
