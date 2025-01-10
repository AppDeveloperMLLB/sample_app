import 'package:flutter/material.dart';

class ChatArea extends StatelessWidget {
  const ChatArea({
    required this.chatList,
    super.key,
  });
  final List<String> chatList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final text = chatList[index];
        return ListTile(
          title: Text(text),
        );
      },
    );
  }
}
