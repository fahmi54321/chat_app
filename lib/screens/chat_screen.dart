import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat app'),
      ),
      body: StreamBuilder<QuerySnapshot>( // todo 1 menambahkan stream builder
        stream: Firestore.instance // todo 2 snapshot pada firestore merupakan value stream
            .collection('chats/ZSOZfn0372aAg0kR3qGI/messages')
            .snapshots(),
        builder: (context, snapshot) {
          print('connect ${snapshot.connectionState}');

          if (snapshot.connectionState == ConnectionState.waiting) { // todo 3 kondisi jika loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = snapshot.data.documents;

          return ListView.builder( //todo 4 bind data ke listview (finish)
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
        onPressed: () {},
      ),
    );
  }
}
