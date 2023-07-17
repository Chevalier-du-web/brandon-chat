import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'gptfree/gptfree.dart';
import 'home.dart';
import 'onboarding/onboarding.dart';

var uuid = Uuid();
int? initScreen;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen',1);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue
      ),
      dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, Darktheme)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brandon AI ',
        darkTheme: Darktheme,
        theme: theme,

// home: isviwed !=0 ? IntroductionScreen():HomePage(),
        initialRoute: initScreen ==0 || initScreen ==null?'onBoard':'home',
        routes: {
          'home' : (context)=>HomePage(),
          'onBoard' : (context)=>OnboardingPage(
              pages:[
                OnboardingPageModel(title: "Hey welcome",description: "optimize your performance and productivity",image: 'assets/image.png'),

                OnboardingPageModel(title: "Ask any questons",description: "ask all your concerns, you will be dazzled by a quick result",image: 'assets/onb1.PNG'),

                OnboardingPageModel(title: "how it works?",description: "just chat in chat mode, let's get started without further ado",image: 'assets/onb2.PNG')

              ] )
        },
      ),
    );
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return  MaterialApp(
//       title: 'Brandon AI',
//       debugShowCheckedModeBanner: false,
//       home: OnboardingPage(pages: [
//
//         OnboardingPageModel(title: "Hey welcome",description: "optimize your performance and productivity",image: 'assets/image.png'),
// //
// //         OnboardingPageModel(title: "Ask any questons",description: "ask all your concerns, you will be dazzled by a quick result",image: 'assets/onb1.PNG'),
// //
// //         OnboardingPageModel(title: "how it works?",description: "just chat in chat mode, let's get started without further ado",image: 'assets/onb2.PNG')
//
//
//       ],),
//     );
//   }
// }


