import 'package:flutter/material.dart';
import 'package:uas/constrants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uas/screen/maps.dart';

import 'members.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Coral_Conservation'),
              accountEmail: Text('coralconservation@gmail.com'),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Image.asset('assets/image/logo.png')),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return HomePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.user),
              title: Text('Anggota'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return Members();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.locationArrow),
              title: Text('Lokasi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return Maps();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: size.height * .4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/bg.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:20),
                    child: Column(
                      children: <Widget>[
                          SizedBox(height: size.height * .1),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Coral Conservation",
                                      style: Theme.of(context).textTheme.display1.copyWith(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Aplikasi android bagi para relawan terumbu karang",
                                      style: Theme.of(context).textTheme.display1.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                  "assets/image/logo.png",
                                  height: 150,
                                ),
                              ],
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:320,horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      listCard(
                        name : "Lokasi",
                        desc: "Lokasi konservasi terumbu karang",
                        press: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return Maps();
                                },
                              ),
                            );
                        },
                      ),
                      listCard(
                        name : "Anggota",
                        desc: "Daftar Anggota Komunitas",
                        press: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return Members();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class listCard extends StatelessWidget {
  final String name;
  final String desc;
  final Function press;
  const listCard({
    Key key,
    this.name,
    this.desc, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical:30, horizontal: 30),
      margin: EdgeInsets.only(bottom:16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,10),
            blurRadius: 33,
            color: Colors.white,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
              text: TextSpan(
                children:[
                  TextSpan(
                    text: "$name\n",
                    style: TextStyle(
                      fontSize: 16,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:"$desc",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: press
              ),
        ],
      ),
    );
  }
}
