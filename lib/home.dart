import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

import 'about_us.dart';
import 'components/list_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon iconDark = Icon(Icons.mode_night_outlined,color: Colors.white);
  Icon iconLight = Icon(Icons.light_mode_outlined,color: Colors.white);
  bool modeDark = false;
  dynamic savedThemeMode;
  bool  darkMode = false;

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
    return  Scaffold(
      appBar: AppBar(
        title: Text('  Brandon AI'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              modeDark = !modeDark;
            });

            if (modeDark==true){
              AdaptiveTheme.of(context).setDark();
            }else{
              AdaptiveTheme.of(context).setLight();
            }
          },
              icon: modeDark?iconDark:iconLight)
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
              ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage('assets/logo_br.png'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 15),
                        child: const Text('Version 2.0',
                          style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),))
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30,left: 30),
              child: Column(
                children: [
                  // list of menus pages
                  Container(
                    margin: const EdgeInsets.all(12),
                      child: ListItem(title: 'About us', icon: Icons.help, onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
                      },)),

                  Container(
                      margin: const EdgeInsets.all(12),
                      child: ListItem(title: 'share', icon: Icons.share, onPressed: () {
                        Navigator.pop(context);
                        Share.share(' contactz-moi au +237657591936'); },)),


                  Container(
                      margin: const EdgeInsets.all(12),
                      child: ListItem(title: 'Exit', icon: Icons.exit_to_app, onPressed: () {
                        SystemNavigator.pop();
                      },)),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: const [

        ],
      ),
    );
  }
}
