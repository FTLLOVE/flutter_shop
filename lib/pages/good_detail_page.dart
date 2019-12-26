import 'package:flutter/material.dart';

class GoodDetailPage extends StatefulWidget {
  final String goodId;

  GoodDetailPage({
    Key key,
    @required this.goodId,
  }) : super(key: key);

  @override
  _GoodDetailPageState createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: Center(
        child: Text("${widget.goodId}"),
      ),
    );
  }
}
