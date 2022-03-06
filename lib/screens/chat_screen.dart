import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat app'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('chats/ZSOZfn0372aAg0kR3qGI/messages')
            .snapshots(),
        builder: (context, snapshot) {
          print('connect ${snapshot.connectionState}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = snapshot.data.documents;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) {
              return Container(
                padding: EdgeInsets.all(8),
                child: Text(documents[index]['title']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance // todo 1 (finish)
              .collection('chats/ZSOZfn0372aAg0kR3qGI/messages')
              .add({'title': 'This was added by clicking the button'});
        },
      ),
    );
  }
}
