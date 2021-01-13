import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uas/api.dart';
import 'detail_member.dart';

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  List data = [];
  void getUser() async {
    api.getData().then((res) {
      setState(() {
        data = res;
      });
      print(data.toString());
    });
  }
  @override
  void initState() {
    getUser();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Anggota',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder:(context, int i){
              return InkWell(
                onTap: (){
                    ChangePage(
                      context,
                      Detail(
                        data: data[i],
                      )
                    );
                },
                child: Card(
                  shadowColor: Colors.blue,
                  child: ListTile(
                    title: Column(
                      children: [
                        Text("${data[i]["name"]}"),
                        Text("${data[i]["email"]}"),
                        Text("${data[i]["address"]["street"]}")
                      ],
                    ),
                  ),
                ),
              );
            }
            ),
      ),
    );
  }
}

class ChangePage {
  ChangePage(BuildContext context, StatefulWidget classes) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return classes;
        },
      ),
    );
  }
}

