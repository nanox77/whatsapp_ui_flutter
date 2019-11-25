import 'package:flutter/material.dart';
import 'package:whatsapp_ui_example/chat_summary_view.dart';
import 'package:whatsapp_ui_example/chat_summary_view_model.dart';
import 'package:whatsapp_ui_example/chats.dart';

final Color textUnreadGreenColor = Color.fromARGB(255, 8, 211, 111);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 7, 94, 85),
      ),
      home: ChatsView(
        title: 'WhatsApp',
        chats: Chats().chatSummaryViewModels,
      ),
    );
  }
}

class ChatsView extends StatelessWidget {
  final String title;
  final List<ChatSummaryViewModel> chats;

  ChatsView({Key key, this.title, this.chats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: buildTabBarView(),
          actions: buildActions(),
        ),
        body: buildChatList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: textUnreadGreenColor,
          child: Icon(Icons.message),
        ),
      ),
    );
  }

  Widget buildChatList() {
    return SafeArea(
      child: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (BuildContext context, int index) => buildDivider(),
        itemBuilder: (BuildContext context, int index) {
          return ChatSummaryView(chats[index]);
        },
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      height: 0.0,
      color: Colors.black38,
      indent: 95.0,
      endIndent: 10.0,
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
    ];
  }

  Widget buildTabBarView() {
    return TabBar(
      indicatorColor: Colors.white,
      tabs: [
        Tab(text: 'CALLS'),
        Tab(text: 'CHATS'),
        Tab(text: 'CONTACTS'),
      ],
    );
  }
}
