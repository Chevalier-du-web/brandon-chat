import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import 'gptfree/gptfree.dart';
import 'home.dart';
import 'onboarding/onboarding.dart';

var uuid = Uuid();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: 'Brandon AI',
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(pages: [

        OnboardingPageModel(title: "Hey welcome",description: "optimize your performance and productivity",image: 'assets/image.png'),

        OnboardingPageModel(title: "Ask any questons",description: "ask all your concerns, you will be dazzled by a quick result",image: 'assets/onb1.PNG'),

        OnboardingPageModel(title: "how it works?",description: "just chat in chat mode, let's get started without further ado",image: 'assets/onb2.PNG')


      ],),
    );
  }
}
