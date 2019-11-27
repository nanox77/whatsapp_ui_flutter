import 'package:flutter/material.dart';
import 'chat_summary_view_model.dart';

class ChatSummaryView extends StatelessWidget {
  final Color textUnreadGreenColor = Color.fromARGB(255, 8, 211, 111);

  final ChatSummaryViewModel chatSummaryViewModel;

  ChatSummaryView(this.chatSummaryViewModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(chatSummaryViewModel.avatar),
        ),
        title: Text(
          chatSummaryViewModel.name,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          chatSummaryViewModel.message,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildTextTime(),
            buildUnreadMessages(),
          ],
        ),
      ),
    );
  }

  Widget buildUnreadMessages() {
    if (chatSummaryViewModel.unreadMessages == 0) {
      return Container(height: 25, width: 25);
    }
    return Container(
      alignment: Alignment.center,
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: textUnreadGreenColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        chatSummaryViewModel.unreadMessages.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildTextTime() {
    return Text(
      chatSummaryViewModel.time,
      style: TextStyle(
        color: chatSummaryViewModel.time.contains(":") ? textUnreadGreenColor : Colors.grey,
      ),
    );
  }
}
