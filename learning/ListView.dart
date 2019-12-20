import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      home: Scaffold(
          body: AdvancedListView(
              items:
                  List<String>.generate(100, (index) => "item ${index + 1}"))),
    );
  }
}

class BasicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("hello"),
        ),
      ],
    );
  }
}

class ImageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Image.network(
          "https://dimg03.c-ctrip.com/images/10020q000000gajaeDB6E_C_360_202.jpg",
          height: 400,
        ),
        Image.network(
          "https://dimg03.c-ctrip.com/images/10020q000000gajaeDB6E_C_360_202.jpg",
          height: 400,
        ),
        Image.network(
          "https://dimg03.c-ctrip.com/images/10020q000000gajaeDB6E_C_360_202.jpg",
          height: 400,
        ),
        Image.network(
            "https://dimg03.c-ctrip.com/images/10020q000000gajaeDB6E_C_360_202.jpg",
            height: 400),
      ],
    );
  }
}

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 200,
            color: Colors.red,
          ),
          Container(
            width: 200,
            color: Colors.blue,
          ),
          Container(
            width: 200,
            color: Colors.pink,
          ),
          Container(
            width: 200,
            color: Colors.green,
          ),
        ],
      ),
    ));
  }
}

class AdvancedListView extends StatelessWidget {
  final List<String> items;

  AdvancedListView({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          title: Text('${items[index]}'),
        );
      },
      itemCount: items.length,
    );
  }
}
