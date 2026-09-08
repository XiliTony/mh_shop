import 'package:flutter/material.dart';
import 'package:mh_shop/pages/login/index.dart';
import 'package:mh_shop/pages/main/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    initialRoute: '/',
    routes: getRootRoutes()
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => HomePage(),
    '/login': (context) => LoginPage(),
  };
}