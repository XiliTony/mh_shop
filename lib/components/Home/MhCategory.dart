import 'package:flutter/material.dart';
import 'package:mh_shop/viewmodels/home.dart';

class MhCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  MhCategory({Key? key, required this.categoryList}) : super(key: key);

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          final CategoryItem category = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, height: 40, width: 40),
                Text(category.name, style: TextStyle(color: Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }
}
