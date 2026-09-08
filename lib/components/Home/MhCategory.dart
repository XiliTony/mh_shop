import 'package:flutter/material.dart';

class MhCategory extends StatefulWidget {
  MhCategory({Key? key}) : super(key: key);

  @override
  _MhCategoryState createState() => _MhCategoryState();
}

class _MhCategoryState extends State<MhCategory> {
  @override
  Widget build(BuildContext context) {
    // return ListView();
    // 返回一个横向滚动的组件
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 100,
            color: Colors.blue,
            child: Text("分类$index", style: TextStyle(color: Colors.white)),
            margin: EdgeInsets.symmetric(horizontal: 10),
          );
        },
      ),
    );
  }
}
