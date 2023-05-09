import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';


class LibChatBubble extends StatelessWidget {
  const LibChatBubble(this.message, this.isMyMessage, {Key? key}) : super(key: key);

  final String message;
  final bool isMyMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMyMessage ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if(isMyMessage) // 내가 보낸 메세지라면
        ChatBubble(
          clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
          backGroundColor: Color(0xffE7E7ED),
          margin: EdgeInsets.only(top: 20),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(message,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        if(!isMyMessage) // 상대가 보낸 메세지라면
        ChatBubble(
          clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 20),
          backGroundColor: Colors.blue,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

      ],
    );
  }
}
