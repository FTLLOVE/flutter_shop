import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        body: CardLayout(
          items: List<String>.generate(100, (int index) => "item$index"),
        ),
      ),
    );
  }
}

class BasicRowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          color: Colors.redAccent,
          onPressed: () {},
          child: Text("Button1"),
        ),
        RaisedButton(
          color: Colors.pink,
          onPressed: () {},
          child: Text("Button2"),
        ),
        RaisedButton(
          color: Colors.green,
          onPressed: () {},
          child: Text("Button3"),
        )
      ],
    );
  }
}

class BasicColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Hello Flutter"),
        Text("Golang"),
        Text("JavaScript")
      ],
    );
  }
}

class BasicStackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: const FractionalOffset(0.5, 0.9),
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Color(0xfff26966),
                borderRadius: BorderRadius.circular(100)),
          ),
          Text("Flutter")
        ],
      ),
    );
  }
}

class AdvancedStackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Color(0xfff26966),
                borderRadius: BorderRadius.circular(10)),
          ),
          Positioned(
            child: Text("Flutter"),
            top: 10,
            left: 10,
          ),
          Positioned(
            child: Text("GoLang"),
            bottom: 10,
            right: 10,
          )
        ],
      ),
    );
  }
}

class CardLayout extends StatelessWidget {
  final List<dynamic> items;

  CardLayout({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(itemBuilder: (BuildContext contxt, int index) {
        return Card(
          child: Container(
            child: Text('${items[index]}'),
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 10),
          ),
          elevation: 0.3,
        );
      }),
    );
  }
}
