import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mh_shop/viewmodels/home.dart';

class MhSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  MhSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _MhSliderState createState() => _MhSliderState();
}

class _MhSliderState extends State<MhSlider> {
  Widget _getSlider() {
    // 在Flutter中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width; // 屏幕宽度
    // 返回轮播图插件
    // 根据数据渲染的不同轮播选项
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        ); // Image.network
      }), // List.generate
      options: CarouselOptions(
        autoPlayInterval: Duration(seconds: 5),
        height: 300,
        viewportFraction: 1,
        autoPlay: true,
      ), // CarouselOptions
    ); // CarouselSlider
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }
}
