import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  String messages; // todo 1 berisi message
  bool isMe; // todo 2 kondisi membedapan sender dan receiver
  final Key key; // todo 3 identitas key masing2 widget chat

  MessageBubble(
    this.messages,
    this.isMe, {
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe == true ? MainAxisAlignment.end : MainAxisAlignment.start, // todo 4 kondisi sender dan receiver
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe == true ? Colors.grey[300] : Theme.of(context).accentColor, // todo 5 kondisi sender dan receiver
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              bottomLeft: isMe == true ? Radius.circular(12) : Radius.circular(0), // todo 6 kondisi sender dan receiver
              bottomRight: isMe == true ? Radius.circular(0) : Radius.circular(12), // todo 7 kondisi sender dan receiver
            ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            messages,
            style: TextStyle(
              color: isMe == true // todo 8 kondisi sender dan receiver (next messages)
                  ? Colors.black
                  : Theme.of(context).accentTextTheme.headline1.color,
            ),
          ),
        ),
      ],
    );
  }
}
