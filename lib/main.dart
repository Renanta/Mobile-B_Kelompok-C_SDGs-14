import 'package:flutter/material.dart';
import 'package:uas/constrants.dart';
import 'package:uas/screen/home_page.dart';
import 'package:uas/screen/login_screen.dart';
import 'package:uas/widget/rounded_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coral Conservation',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme : Theme.of(context).textTheme.apply(displayColor:kBlackColor)
      ),
      home: startPage(),
    );
  }
}



class startPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width : double.infinity,
        decoration: BoxDecoration(image:DecorationImage(
          image: AssetImage('assets/image/wallpaper.jpg'),
          fit: BoxFit.fill,
        )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.display3,
                children: [
                  TextSpan(
                    text:"Co",
                  ),
                  TextSpan(
                    text: "Co",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "Mulai",
                fontSize : 20,
                press: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return LoginScreen();
                        },
                    ),
                  );
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
