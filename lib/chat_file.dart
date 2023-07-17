import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'gptfree/gptfree.dart';
import 'main.dart';


class ChatScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ChatScreenState();

}

class ChatScreenState extends State<ChatScreen> {

  final List<types.Message> _messages = [];
  bool modeDark = false;
  dynamic savedThemeMode;
  bool  darkMode = false;

  final _user = types.User(id: uuid.v4());
  final _chatGPT = types.User(id: uuid.v4());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentTheme();

  }
  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    print(savedThemeMode.toString());
    if(savedThemeMode.toString() =='AdaptiveThemeMode.dark'){
      setState(() {
        darkMode = true;
      });
    }else{
      setState(() {
        darkMode = false;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brandon AI ", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () {},
              icon: const Icon(Icons.history, color: Colors.white,))

        ],
      ),
      body: Chat(
        theme: DefaultChatTheme(
            inputBackgroundColor: Theme
                .of(context)
                .colorScheme
                .onBackground,
            inputBorderRadius: BorderRadius.circular(10),
            inputContainerDecoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.blue,
              borderRadius: BorderRadius.circular(0),

            )
        ),
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime
          .now()
          .millisecondsSinceEpoch,
      id: uuid.v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    _callChatGPT(message.text);
  }

  void _callChatGPT(String prompt) async {
    final response = await GPTfree.create(prompt: prompt);

    final textMessage = types.TextMessage(
      author: _chatGPT,
      createdAt: DateTime
          .now()
          .millisecondsSinceEpoch,
      id: uuid.v4(),
      text: response["text"],
    );

    _addMessage(textMessage);
  }

}