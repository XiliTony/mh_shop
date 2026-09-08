import 'package:flutter/material.dart';

class MhMoreList extends StatefulWidget {
  MhMoreList({Key? key}) : super(key: key);

  @override
  _MhMoreListState createState() => _MhMoreListState();
}

class _MhMoreListState extends State<MhMoreList> {
  @override
  Widget build(BuildContext context) {
    // 必须是Sliver家族的组件
    return SliverGrid.builder(
      // 网格是两列
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text("商品", style: TextStyle(color: Colors.white)),
          color: Colors.blue,
          alignment: Alignment.center,
        );
      },
    );
  }
}
