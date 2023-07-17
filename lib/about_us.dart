import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String apropos = "    This application has been designed to facilitate "
        "learning and training in all areas"
        " the principle is simple, ask your questions and get your result. \n"
        "It is a smart application capable of solving any type of problem."
        "In Math, Science, English, Philosophy, etc..\n\n The current version"
        "will change over time. Because the packages will have to be "
        "updates . \n\n\nFeel free to contact us in case"
        " to need the services and also when using the software. \n\n\n "
        "Thank you and good use ...." ;
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100))
              ),
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage('assets/logo3.png'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text('Brandon AI',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Version 2.0'),
            Container(
              margin: EdgeInsets.only(top: 20,left: 40,right: 40),
              child: Text(apropos,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 9,),
            Text('Developper : Sangon Brangon',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            SizedBox(height: 9,),
            Text('brandonsangon5@gmail.com',style: TextStyle(fontSize: 15)),
            SizedBox(height: 10,),
            Divider(),

            SizedBox(height: 20,),

            //For contact me on whatsapp
            Container(

              child: FlutterSocialButton(
                onTap:()async{
                  var message = "Salut Mr Brandon, concepteur de "
                      "l\'application Servus, je desire entrer en possession de votre produit...";
                  var number = '+237657591936';
                  var url = "whatsapp://send?phone=$number&text=$message";
                  await canLaunch(url)?launch(url):print('erreur de lien');
                },
                buttonType: ButtonType.whatsapp,
                iconColor: Colors.white,
                title: "Contact me by whatsapp",

              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
