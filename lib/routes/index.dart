// 管理路由
import 'package:flutter/material.dart';
import 'package:mh_shop/pages/Login/index.dart';
import 'package:mh_shop/pages/Home/index.dart';

// 返回App根级组件
Widget getRootWidget() {
  return MaterialApp(
    // 命名路由
    initialRoute: '/',
    routes: getRootRoutes()
  );
}

// 返回该App的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => HomePage(),
    '/login': (context) => LoginPage(),
  };
}