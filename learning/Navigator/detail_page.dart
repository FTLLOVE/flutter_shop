import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;

  DetailPage({Key key, this.title}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Home"),
            ),
          ),
        ],
      ),
    );
  }
}
