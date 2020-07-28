import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:rabbitplanm/models/newwords.dart';
import 'package:rabbitplanm/models/token.dart';
import 'package:rabbitplanm/models/user.dart';
import 'package:rabbitplanm/models/wordgroup.dart';

import 'global.dart';
//import '../index.dart';

class Git {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;
  static Dio dio = new Dio(BaseOptions(
    //baseUrl: 'http://116.62.162.224/',
    baseUrl: 'http://192.168.3.88:8000/',
    headers: {
      //HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
     //     "application/vnd.github.symmetra-preview+json",
    },
  ));

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        //client.findProxy = (uri) {
        //  return "PROXY 10.1.10.250:8888";
        //};
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // 登录接口，登录成功后返回用户信息
  Future<User> login(String login, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    var params = {
      "username": login,
      "password": pwd
    };
    var r = await dio.post(
      "api-token-auth/",
      data: params,
      options: _options.merge(headers: {
        //HttpHeaders.authorizationHeader: basic,
      },
      contentType:Headers.formUrlEncodedContentType,
      extra: {
        "noCache": true, //本接口禁用缓存
      }),
    );
    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers["Authorization"] = "Token " + r.data["token"];
    //清空所有缓存
    Global.netCache.cache.clear();
    //更新profile中的token信息
    Global.profile.token = r.data["token"];
    return User.fromJson(r.data);
  }

  //获取生词组列表
  Future<List<Wordgroup>> getWgroup(
      {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
        refresh = false}) async {
    if (refresh) {
      // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
      _options.extra.addAll({"refresh": true, "list": true});
    }
    var r = await dio.get<List>(
      "rabbitapi/wordgroups/",
      queryParameters: queryParameters,
      options: _options,
    );
    return r.data.map((e) => Wordgroup.fromJson(e)).toList();
  }

  //获取生词组内生词
  Future getGroupWords(
      {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
        refresh = false, int groupid}) async {
    if (refresh) {
      // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
      _options.extra.addAll({"refresh": true, "list": true});
    }
    var r = await dio.get(
      "rabbitapi/nwordsgroup/"+groupid.toString()+"/",
      queryParameters: queryParameters,
      options: _options,
    );
    //print(r);
    return r;    //r.data.map((e) => Newwords.fromJson(e)).toList();
  }
}