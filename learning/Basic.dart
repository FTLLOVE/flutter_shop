import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("learning001"),
        ),
        body: Center(
          child: Container(
            child: Text(
              "Hello World Hello World Hello World Hello World Hello World Hello World Hello World",
              textAlign: TextAlign.left,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.lightBlue,
                  color: Colors.red,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
