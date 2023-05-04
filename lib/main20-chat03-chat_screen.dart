import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // firebase auth 인스턴스 생성
  final _authFirebase = FirebaseAuth.instance;
  // 현재 로그인한 유저 firebase user 자료형
  User? loginUser;
  // 현재 로그인 중인 유저 받아오는 함수
  void getCurrentUser() {
    // FirebaseAuth.instance 는 앱 전체에서 공유해서 하나만 쓰는 듯..? java 에서 static 이나 singleton 디자인처럼
    // FirebaseAuth.instance 이 인스턴스를 만들어서 그 안에 user name / password 넣은 거는 login screen 이었지
    // 근데 또 chat screen 에서도 인스턴스 따로 하나 만들어다가 그 안에서 뭐 꺼내다 쓰려고 하는데 아까 이전 페이지에서 통신하던 그 유저 값을 받아올 수 있나 봄.
    try {
      final userCurrent = _authFirebase.currentUser;
      if(userCurrent != null) {
        loginUser = userCurrent;
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$loginUser 님 환영합니다"),
            backgroundColor: Colors.blue,
          )
      );
    } catch(e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // firebase 현재 로그인 유저 정보 받아 넣기
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello world"),
        actions: [
          // firebase 로그아웃 기능 만들기
          IconButton(
              onPressed: () {
                // firebase 에서 로그인 정보 지우기
                _authFirebase.signOut();
                // 로그아웃 했으니까 다시 로그인 페이지로 이동
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              )
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("chats/wD3okeu7jU7XjlorbZPc/message").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          // 아직 데이터를 받아오기도 전인데 출력부터 하려고 하니까 에러가 남
          // 데이터를 받아오기 전이라면 로딩 화면 보여주기
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(docs[index]["text"]),
                );
              },
          );
        },
      ),
    );
  }
}
