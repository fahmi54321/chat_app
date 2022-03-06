import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text('This works!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance
              .collection('chats/ZSOZfn0372aAg0kR3qGI/messages')
              .snapshots()
              .listen(
            (data) {
              // print(data.documents[0]['text']);
              data.documents.forEach((element) {
                print(element['title']);
              });
            },
          );
        },
      ),
    );
  }
}
