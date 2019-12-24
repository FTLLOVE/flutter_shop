/**
 * @author: FTL
 * @date: 2019-12-23 13:35
 * @desc: 分类
 */
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("分类"),
          elevation: 0,
        ),
        body: StaggeredGridView.count(
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: const <Widget>[
            const Text('1'),
            const Text('2'),
            const Text('3'),
            const Text('4'),
            const Text('5'),
            const Text('6'),
            const Text('7'),
            const Text('8'),
          ],
          staggeredTiles: const <StaggeredTile>[
            const StaggeredTile.count(2, 2),
            const StaggeredTile.count(2, 1),
            const StaggeredTile.count(2, 2),
            const StaggeredTile.count(2, 1),
            const StaggeredTile.count(2, 2),
            const StaggeredTile.count(2, 1),
            const StaggeredTile.count(2, 2),
            const StaggeredTile.count(2, 1),
          ],
        )
    );
  }
}
