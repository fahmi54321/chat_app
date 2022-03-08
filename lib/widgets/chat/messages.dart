import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//todo 1 (next chat_screen)
class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('chat').snapshots(),
      builder: (
        ctx,
        chatSnapshot,
      ) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final chatDocs = chatSnapshot.data.documents;

        return ListView.builder(
          itemCount: chatDocs.length,
          itemBuilder: (ctx, index) {
            return Text(chatDocs[index]['text']);
          },
        );
      },
    );
  }
}
