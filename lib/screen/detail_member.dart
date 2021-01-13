import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Map data;
  Detail({this.data});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Anggota"),
        backgroundColor: Colors.blue,
      ),
      body: Card(
        child: ListTile(
          title: Column(
            children: [
              Text('Data diri'),
              Text('${widget.data['name']}'),
              Text('${widget.data['username']}'),
              Text('${widget.data['email']}'),
              Text('${widget.data['phone']}'),
              Text('${widget.data['website']}'),
              SizedBox(height: 20),
              Text('Data Alamat'),
              SizedBox(height: 10),
              Text('${widget.data['address']['street']}'),
            ],
          ),
        ),
      ),
    );
  }
}