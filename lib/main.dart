import 'package:first_app/main20-chat03-chat_screen.dart';
import 'package:flutter/material.dart';
import 'main20-chat02-login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // firebase 쓰려면 Firebase.initializeApp() 을 항상 먼저 실행해 줘야 함.
  // 근데 그러려면 flutter 바탕 App 이 먼저 초기화되어 있어야 함.
  // firebase 는 flutter app 이랑 연동하려고 하는데 flutter app 쪽이 먼저 올라가 있지 않으면 실패하기 때문
  // 그래서 Firebase.initializeApp() 를 부르기 전에는 먼저 WidgetsFlutterBinding.ensureInitialized() 를 부름.
  // app 이 먼저 올라가 있는지 확실하게 하고 나서 firebase 실행함.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chatting App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ChatScreen();
          }
          return LoginSignupScreen();
          // 일단 기존에는 어떤 방식으로 작동했는지?
          // 그리고 그 방법으로 하면 어떤 문제점이 있는지?
          // 마지막으로 해결책은 뭔지?
          // 이전에는 아이디/비번 입력하고 나서 로그인 버튼/가입하기 버튼을 클릭하면 FirebaseAuth 다녀옴.
          // FirebaseAuth 에 다녀와서 (로그인 or 가입하기) 문제 없으면 chat screen 띄워주는 방식.
          // 그럼 이 방식으로 했을 때 어떤 문제가 있냐?
          // 이때 문제는 오른쪽 상단에 logout 버튼 클릭해서 다시 로그인 화면으로 왔을 때임.
          // 내가 이전에 입력해 두었던 아이디/비번이 그대로 남아 있음.
          // 보안상 문제가 크겠지...
          // 자 그래서 해결책이 뭐냐?
          // 이제는 (Login 화면 or Chat 화면) 을 띄워주는 걸 버튼 클릭 함수에서 Navigation.push() 로 안 하기로 함.
          // 대신 main.dart 에서 home 화면을 자체를 다시 띄어주게끔 만들기. Login/Chat 화면을 동적으로 보여주게끔 만들기로 함.
          // StreamBuilder 로 일단 FirebaseAuth 로부터 로그인 사용자 정보를 구독함.
          // 구독하고 있는 stream 의 로그인한 사용자의 정보가 바뀌면 authStateChanges() 그걸 감지해서 builder 가 새로 작동함.
          // builder 는 로그인 사용자 정보를 보고 로그인한 상태면 Chat 화면을 띄워줌.
          // 로그인한 상태가 아니라면 로그인하라고 로그인 화면을 띄워줌.
          // 이렇게 해서 끝나면 좋은데, 구조가 바뀐 만큼 기존 로직도 살짝 수정해야 함.
          // 이대로 하면 로그인 했을 때 Chat 화면이 두 겹으로 뜨게 됨.
          // main.dart 에 있는 home 이 StreamBuilder 로 한 번 띄워주고, 로그인/가입하기 버튼을 클릭했을 때 Navigation.push() 로 한 번 띄워주고.
          // 그냥 이렇게 두면 로그아웃 버튼 작동에 문제가 생김.
          // 어떤 문제냐?
          // Chat 화면이 두 겹으로 겹쳐 있을 때 로그아웃 버튼을 누르면 큰 문제는 없음.
          // 근데 Chat 화면에서 뒤로가기 버튼을 한 번 누르면 Chat 화면이 한 번 더 뜨겠지.
          // 이 상태에서 로그아웃 버튼을 누르면 화면이 까맣게 되면서 에러가 남.
          // 로그인 했을 때 화면 스택은 home 에 Chat 화면이 먼저 깔리고, Navigation.push() 해서 Chat 화면이 그 위로 하나 더 깔림.
          // 여기서 뒤로가기 버튼을 한 번 누르면 Navigation.pop() 되면서 화면 stack 에는 home 하나만 남음.
          // 이 상태에서 로그아웃 버튼을 누르면 Navigation.pop() 이 또 되면서 더 이상 화면 stack 이 남아 있질 않음.
          // 로그아웃 돼서 Stream 이 바뀌고, home 화면이 로그인 화면을 띄워줘야 하는데, 이미 home 화면까지 stack 에서 pop 해버린 상황...
          // 그래서 해결책은?
          // 기존에 로그인/가입하기 버튼에서 Navigation.push() 해주던 걸 지우고, 로그아웃 버튼에서 Navigation.pop() 해주던 걸 지우기.
          // 그러면 (log in 화면 or Chat 화면)을 Navigation 써서 push() 도 하지 않고 pop() 도 하지 않음.
          // 화면 stack 으로 관리하는 게 아니라, home 화면 자체가 동적으로 바뀌는 방식으로 바뀜.
          // 이제 로그인할 때 아이디/패스워드 입력하고 나서 로그인 하고, 다시 로그아웃 해도 입력값이 남아 있지 않음.


        },
      ),
    );
  }
}
