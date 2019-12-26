import 'package:flutter/material.dart';

void goPage(BuildContext context, Widget pageName) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
}
