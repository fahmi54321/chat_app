import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessages extends StatefulWidget {

  @override
  _NewMessagesState createState() => _NewMessagesState();
}

//todo 1 (next messages)

class _NewMessagesState extends State<NewMessages> {

  final _controller = TextEditingController();

  var _enteredMessage = '';

  void _sendMessages(){
    FocusScope.of(context).unfocus();
    Firestore.instance.collection('chat').add({
      'text' : _enteredMessage,
      'createdAt' : Timestamp.now(),
    });
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value){
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessages,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
