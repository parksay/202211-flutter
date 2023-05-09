import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  // 채팅창 메세지 입력하는 TextField 를 control 할 controller
  final _controller = TextEditingController();

  // 어차피 이 클래스 내부에서만 쓰고 소멸할 변수들이라서 private 으로 선언해 두기
  String _userText = "";
  void _sendMessage() {
    // map 타입으로 파라미터 넣어줘야 함
    FirebaseFirestore.instance.collection("chat").add({
      // key: value
      "text": _userText,  // 사용자가 입력한 메세지
      "timestamp": Timestamp.now(), // Timestamp 는 Firestore 가 자체적으로 정의해 둔 데이터 타입
      "userId": FirebaseAuth.instance.currentUser!.uid,
    });
    FocusScope.of(context).unfocus();
    // 입력창에 입력하고 있던 메세지 지우고 초기화
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              // 사용자가 메세지를 길게 입력하면 다음 줄로 안 넘어가고 한 줄에서 옆으로 길게 넘어감
              // 그 이유는 "TextField" 위젯 소스 코드 안을 뜯어 보면 선언할 때 this.maxLines = 1 라고 되어 있음
              // default 로 maxLines 를 1로 주고 있으니 입력창을 길게 입력해도 한 줄로만 나옴.
              // 이걸 null 로 바꾸면 다음 줄로 자동으로 넘어감.
              maxLines: null,
              controller: _controller,
              decoration: InputDecoration(labelText: "please input message here"),
              onChanged: (value) {
                setState(() {
                  _userText = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Colors.blue,
            // html 에서는 disabled 속성이 따로 있었지만 dart 에서는 onPressed 속성에 null 을 넣으면 disabled 되는 듯.
            onPressed: _userText.trim().isEmpty ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}
