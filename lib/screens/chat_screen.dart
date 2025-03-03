import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ChatScreen());
  }
}

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {"text": "Are you coming?", "isMe": true, "time": "8:10 pm"},
    {"text": "Hay, Congratulation for order", "isMe": false, "time": "8:11 pm"},
    {"text": "Hey Where are you now?", "isMe": true, "time": "8:11 pm"},
    {"text": "I'm Coming, just wait ...", "isMe": false, "time": "8:12 pm"},
    {"text": "Hurry Up, Man", "isMe": true, "time": "8:12 pm"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Robert Fox"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment:
                      message['isMe']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          message['isMe']
                              ? Colors.orangeAccent
                              : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['text'],
                          style: TextStyle(
                            color:
                                message['isMe'] ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          message['time'],
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Write something...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
