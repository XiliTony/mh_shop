import 'package:flutter/material.dart';
import 'package:mh_shop/api/home.dart';
import 'package:mh_shop/components/Home/MhCategory.dart';
import 'package:mh_shop/components/Home/MhHot.dart';
import 'package:mh_shop/components/Home/MhMoreList.dart';
import 'package:mh_shop/components/Home/MhSlider.dart';
import 'package:mh_shop/components/Home/MhSuggestion.dart';
import 'package:mh_shop/viewmodels/home.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<BannerItem> _bannerList = [
    // BannerItem(
    //   id: "1",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    // ),
    // BannerItem(
    //   id: "2",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png",
    // ),
    // BannerItem(
    //   id: "3",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
    // ),
  ];
  List<CategoryItem> _categoryList = [];

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  List<Widget> _getScrollChildren() {
    return [
      // 包裹普通widget的sliver家族的组件
      SliverToBoxAdapter(child: MhSlider(bannerList: _bannerList)), // 轮播图组件
      // 放置分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // SliverGrid和SliverList只能纵向排列
      SliverToBoxAdapter(
        child: MhCategory(categoryList: _categoryList),
      ), // 分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: MhSuggestion(specialRecommend: _specialRecommend),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: MhHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MhHot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      MhMoreList(recommendList: _recommendList), // 无限滚动列表
    ];
  }

  // 特惠推荐
  SpecialRecommend _specialRecommend = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );

  // 热榜推荐
  SpecialRecommend _inVogueResult = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialRecommend _oneStopResult = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );

  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  // 页码
  int _page = 1;
  bool _isLoading = false; // 当前正在加载状态
  bool _hasMore = true; // 是否还有下一页

  // 获取推荐列表
  void _getRecommendList() async {
    // 当已经有请求正在加载 或者已经没有下一页了 就放弃请求
    if (_isLoading || !_hasMore) {
      return;
    }
    _isLoading = true; // 占住位置
    int requestLimit = _page * 8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isLoading = false; // 松开位置
    setState(() {});

    // 我要10条 你给10条 说明我要的你都给了 接着认为还有下一页
    // 我要10条 你给9条
    if (_recommendList.length < requestLimit) {
      _hasMore = false;
      return;
    }
    _page++; // _page +=1;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannderList();
    _getCategoryList();
    _getSpecialRecommend();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
    _registerEvent();
  }

  // 监听滚动到底部的事件
  void _registerEvent() {
    _controller.addListener(() {
      if (_controller.position.pixels >=
          (_controller.position.maxScrollExtent - 50)) {
        _getRecommendList();
      }
    });
  }

  // 获取特惠推荐
  void _getSpecialRecommend() async {
    _specialRecommend = await getSpecialRecommendAPI();
    setState(() {});
  }

  // 获取轮播图列表
  void _getBannderList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  // 获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren(),
      controller: _controller, // 绑定控制器
    ); // sliver家族的内容
  }
}
