import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('  Brandon AI'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
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
                      margin: EdgeInsets.only(top: 15),
                        child: Text('Version 2.0',
                          style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),))
                  ],
                ),
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
