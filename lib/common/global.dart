import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:rabbitplanm/models/cacheConfig.dart';
import 'package:rabbitplanm/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'diocache.dart';
import 'site_api.dart';

// 提供五套可选主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static SharedPreferences _prefs; //static 关键字来实现类级别的变量和函数，建立 SharedPreferences 类
  static Profile profile = Profile(); // 声明 profile model类
  // 网络缓存对象
  static NetCache netCache = NetCache();

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance(); //await 将操作放入到延迟运算的队列（await）中去，await 必须在async中使用
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }

    // 如果没有缓存策略，设置默认缓存策略
    profile.cache = profile.cache ?? CacheConfig() //expr1 ?? expr2,如果expr1为非空，则返回其值；否则，计算并返回expr2的值。
      ..enable = true   // ..允许您对同一对象执行一系列操作。除了函数调用，您还可以访问同一对象上的字段。
      ..maxAge = 3600
      ..maxCount = 100;

    //初始化网络请求相关配置
    Git.init();
  }

  // 持久化Profile信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}