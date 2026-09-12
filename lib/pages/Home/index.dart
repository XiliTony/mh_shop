import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_shop/api/user.dart';
import 'package:mh_shop/pages/Cart/index.dart';
import 'package:mh_shop/pages/Category/index.dart';
import 'package:mh_shop/pages/main/index.dart';
import 'package:mh_shop/pages/mine/index.dart';
import 'package:mh_shop/stores/TokenManager.dart';
import 'package:mh_shop/stores/UserController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 定义数据 根据数据进行渲染4个导航
  // 一般应用程序的导航是固定的
  final List<Map<String, String>> _tabList = [
    // 首页标签
    {
      "icon": 'lib/assets/ic_public_home_normal.png', // 未选中状态图标
      "active_icon": 'lib/assets/ic_public_home_active.png', // 选中状态图标
      "name": '首页', // 标签名称
    },
    // 分类标签
    {
      "icon": 'lib/assets/ic_public_pro_normal.png',
      "active_icon": 'lib/assets/ic_public_pro_active.png',
      "name": '分类',
    },
    // 购物车标签
    {
      "icon": 'lib/assets/ic_public_cart_normal.png',
      "active_icon": 'lib/assets/ic_public_cart_active.png',
      "name": '购物车',
    },
    // 我的标签
    {
      "icon": 'lib/assets/ic_public_my_normal.png',
      "active_icon": 'lib/assets/ic_public_my_active.png',
      "name": '我的',
    },
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["name"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [MainView(), CategoryView(), CartView(), MineView()];
  }

  @override
void initState() {
  // TODO: implement initState
  super.initState();
  // 初始化用户
  _initUser();
}

final UserController _userController = Get.put(UserController());

_initUser() async {
  await tokenManager.init();  // 初始化token
  if (tokenManager.getToken().isNotEmpty) {
    // 如果token有值就获取用户信息
    _userController.updateUserInfo(await getUserInfoAPI());
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea避开安全区组件
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getChildren(), // 放置四个组件
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
      ),
    );
  }
}
