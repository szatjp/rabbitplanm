import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbitplanm/routes/homepage.dart';
import 'package:rabbitplanm/routes/routes.dart';
import 'package:rabbitplanm/states/profile_change_notifier.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/global.dart';
import 'i18n/localization_intl.dart';

void main() {
  //runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
              theme: ThemeData(
                primarySwatch: themeModel.theme,
              ),
              onGenerateTitle: (context) {
                return GmLocalizations.of(context).title;
              },
              home: MyHomePage(title: 'Flutter Demo Home Page'),
              locale: localeModel.getLocale(),
              //我们只支持美国英语和中文简体
              supportedLocales: [
                const Locale('en', 'US'), // 美国英语
                const Locale('zh', 'CN'), // 中文简体
                //其它Locales
              ],
              localizationsDelegates: [
                // 本地化的代理类
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GmLocalizationsDelegate()
              ],
              localeResolutionCallback:
                  (Locale _locale, Iterable<Locale> supportedLocales) {
                if (localeModel.getLocale() != null) {
                  //如果已经选定语言，则不跟随系统
                  return localeModel.getLocale();
                } else {
                  //跟随系统
                  Locale locale;
                  if (supportedLocales.contains(_locale)) {
                    locale = _locale;
                  } else {
                    //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                    locale = Locale('en', 'US');
                  }
                  return locale;
                }
              },
              // 注册路由表
              /*routes: <String, WidgetBuilder>{
              //"login": (context) => LoginRoute(),
              //"themes": (context) => ThemeChangeRoute(),
              //"language": (context) => LanguageRoute(),
              },*/
            // 初始化的时候加载的路由
            initialRoute: '/',
            // 为了路由传参，这么做
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

 */
