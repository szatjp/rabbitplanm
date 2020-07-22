import 'package:flutter/material.dart';
import 'package:rabbitplanm/routes/studypage.dart';

import 'defaultpage.dart';
import 'homepage.dart';

// 配置路由
final routes = {
  '/': (context) => MyHomePage(),
  '/default': (context) => DefaultPage(),
  //'/search': (context, { arguments }) => SearchPage(arguments: arguments),
  '/study': (context) => StudyPage(),
  //'/productinfo': (context, { arguments }) => ProductInfoPage(arguments: arguments),
};

// 固定写法
var onGenerateRoute = (RouteSettings settings){
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context)
      );
      return route;
    }
  }
};