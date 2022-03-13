import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messages;
  final String username; // todo 1
  final bool isMe;
  final Key key;

  MessageBubble(
    this.messages,
    this.username, // todo 2
    this.isMe, {
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMe == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color:
                isMe == true ? Colors.grey[300] : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              bottomLeft:
                  isMe == true ? Radius.circular(12) : Radius.circular(0),
              bottomRight:
                  isMe == true ? Radius.circular(0) : Radius.circular(12),
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
          child: Column(
            crossAxisAlignment: isMe == true
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                username, // todo 3 (next messages.dart)
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe == true
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.headline1.color,
                ),
              ),
              Text(
                messages,
                style: TextStyle(
                  color: isMe == true
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.headline1.color,
                ),
                textAlign: isMe == true ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
