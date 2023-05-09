import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMyMessage, {Key? key}) : super(key: key);

  final String message;
  final bool isMyMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMyMessage ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          width: 145,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: isMyMessage ? Colors.grey[300] : Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: isMyMessage ? Radius.circular(12) : Radius.circular(0),
              bottomLeft: isMyMessage ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          child: Text(message,
            style: TextStyle(
              color: isMyMessage ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
