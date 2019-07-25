import 'package:flutter/material.dart';
import 'package:frenzy_chat_app/chat_message.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage>_message = <ChatMessage> [];

  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text:  text,
    );
    //rebuild list
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textComposerWidget(){

      return IconTheme(
        data: new IconThemeData(color: Colors.blue),
          child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  decoration: new InputDecoration.collapsed(hintText: "Send a message"),
                      controller: _textController,
                         onSubmitted: _handleSubmitted,
                  ),

              ),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
                  
                       ),
                    )
                  ],
                ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return _textComposerWidget(
       
    );
  }
}