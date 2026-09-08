import 'package:flutter/material.dart';
import 'package:mh_shop/components/Home/MhCategory.dart';
import 'package:mh_shop/components/Home/MhHot.dart';
import 'package:mh_shop/components/Home/MhMoreList.dart';
import 'package:mh_shop/components/Home/MhSlider.dart';
import 'package:mh_shop/components/Home/MhSuggestion.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> _getScrollChildren() {
    return [
      // 包裹普通widget的sliver家族的组件
      SliverToBoxAdapter(child: MhSlider()), // 轮播图组件
      // 放置分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // SliverGrid和SliverList只能纵向排列
      SliverToBoxAdapter(child: MhCategory()),  // 分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: MhSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(        
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: MhHot()), 
              SizedBox(width: 10),
              Expanded(child: MhHot())
            ],
          )
        )        
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      MhMoreList()  // 无限滚动列表
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren(),);  // sliver家族的内容
  }
}