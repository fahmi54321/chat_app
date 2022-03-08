import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('chat').orderBy('createdAt',descending: true,).snapshots(), //todo 2 (next chat_screen)
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
          reverse: true, // scroll from the botton to the top
          itemCount: chatDocs.length,
          itemBuilder: (ctx, index) {
            return Text(chatDocs[index]['text']);
          },
        );
      },
    );
  }
}
