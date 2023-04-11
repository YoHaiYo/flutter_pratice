import 'package:flutter/material.dart';

class BulletinBoardApp extends StatefulWidget {
  @override
  _BulletinBoardAppState createState() => _BulletinBoardAppState();
}

class _BulletinBoardAppState extends State<BulletinBoardApp> {
  List<String> _messages = [];

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulletin Board'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _addMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
      });
      _messageController.clear();
    }
  }
}
