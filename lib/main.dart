import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import 'gptfree/gptfree.dart';

var uuid = Uuid();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT free',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ChatScreenState();

}

class ChatScreenState extends State<ChatScreen>{

  final List<types.Message> _messages = [];

  final _user = types.User(id: uuid.v4());
  final _chatGPT = types.User(id: uuid.v4());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brandon Chat",style:TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        actions: [
         IconButton(onPressed: (){}, icon: const Icon(Icons.history,color: Colors.white,))

        ],
      ),
      body: Chat(
        theme: DefaultChatTheme(
            inputBackgroundColor: Theme.of(context).colorScheme.onBackground,
            inputBorderRadius: BorderRadius.zero,
            inputContainerDecoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
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
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: uuid.v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    _callChatGPT(message.text);
  }

  void _callChatGPT(String prompt) async{
    final response = await GPTfree.create(prompt: prompt);

    final textMessage = types.TextMessage(
      author: _chatGPT,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: uuid.v4(),
      text: response["text"],
    );

    _addMessage(textMessage);
  }


}