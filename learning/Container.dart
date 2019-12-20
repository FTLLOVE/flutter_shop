import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter",
      home: Scaffold(
        body: Center(
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://dimg03.c-ctrip.com/images/10020q000000gajaeDB6E_C_360_202.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.amber, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
