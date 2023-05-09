import 'package:cloud_firestore/cloud_firestore.dart';
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
  var _userText = "";
  void _sendMessage() {
    FirebaseFirestore.instance.collection("chat").add({
      "text": _userText,
      "timestamp": Timestamp.now(),
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
