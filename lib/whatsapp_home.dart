

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/pages/camera_screen.dart';

import 'pages/call_screen.dart';
import 'pages/chat_screen.dart';
import 'pages/status_screen.dart';



class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;


  WhatsAppHome(this.cameras);


  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
 with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4,
        vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
            icon: Icon(Icons.camera_alt)),
            Tab(text: "CHAT"),
            Tab(text: "STATUS",),
            Tab(text: "CALLS",)
          ],
        ),

        actions: <Widget>[
          Icon(Icons.search),
          Padding(padding: EdgeInsets.only(right: 10)),
          Icon(Icons.more_vert)

        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(widget.cameras),
          ChatScreen(),
          StatusScreen(),
          CallScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
         backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.message, color: Colors.white,),
        onPressed: () => print("Open Chat"),
      )
    );
  }
}
