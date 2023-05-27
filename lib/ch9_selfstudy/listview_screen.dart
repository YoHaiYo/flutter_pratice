import 'package:flutter/material.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({Key? key}) : super(key: key);

  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListviewScreen"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          /// ListTile에서 leading은 왼쪽, title은 중앙, trailing은 오른쪽에 위치고정임.
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              print("You select Home");
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text("Event"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              print("You select Event");
            },
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Camera"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              print("You select Camera");
            },
          ),
        ],
      ),

    );
  }
}
