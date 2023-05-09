import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/main20-chat07-my_chat_bubble.dart';
import 'package:first_app/main20-chat08-lib_chat_bubble.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("chat")
          .orderBy("timestamp", descending: true) // 와 orderBy 까지 겁나 편하게 넣어줄 수가 있네 간단한 db 기능은 firestore 에서도
          .snapshots(),
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        // 아직 데이터를 받아오기도 전인데 출력부터 하려고 하니까 에러가 남
        // 데이터를 받아오기 전이라면 로딩 화면 보여주기
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data!.docs;
        // React 에서는 eleList.forEach((ele, idx, arr) { return ... });
        // 이렇게 그냥 반복문 돌리면서 만드는데 jsp 도 그렇고
        // flutter 에서는 ListView 라는 객체에 builder 라는 멤버 메소드를 활용
        // StreamBuilder 할 때도 builder 속성을 줬었지
        // 얘네는 builder 라는 개념으로 렌더링 기능을 주고 받나 보군
        return ListView.builder(
          // 아래부터 채움. 웹에서 "justify-content: flex-end;" 같은 느낌
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (context, index) {
            // 내가 만든 메세지 버블 위젯
            // return MyChatBubble(
            //     chatDocs[index]["text"],
            //     chatDocs[index]["userId"].toString() == FirebaseAuth.instance.currentUser!.uid
            // );
            // flutter library 로 만든 메세지 버블 위젯
            return LibChatBubble(
                chatDocs[index]["text"],
                chatDocs[index]["userId"].toString() == FirebaseAuth.instance.currentUser!.uid
            );
          },
        );
      }
    );
  }
}
