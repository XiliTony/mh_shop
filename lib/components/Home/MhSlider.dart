import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mh_shop/viewmodels/home.dart';

class MhSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const MhSlider({super.key, required this.bannerList});

  @override
  _MhSliderState createState() => _MhSliderState();
}

class _MhSliderState extends State<MhSlider> {
  final CarouselSliderController _controller =
      CarouselSliderController(); // 控制轮播图跳转的控制器
  int _currentIndex = 0;
  Widget _getSlider() {
    // 在Flutter中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width; // 屏幕宽度
    // 返回轮播图插件
    // 根据数据渲染的不同轮播选项
    return CarouselSlider(
      carouselController: _controller, // 绑定controller对象
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
        onPageChanged: (int index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ), // CarouselOptions
    ); // CarouselSlider
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      right: 0,
      left: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      bottom: 10,
      right: 0,
      left: 0,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: index == _currentIndex ? 40 : 20,
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
