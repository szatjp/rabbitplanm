import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbitplanm/common/funs.dart';
import 'package:rabbitplanm/common/global.dart';
import 'package:rabbitplanm/common/site_api.dart';
import 'package:rabbitplanm/models/user.dart';
import 'package:rabbitplanm/states/profile_change_notifier.dart';
export 'package:provider/provider.dart';

import 'homepage.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin;
    if (_unameController.text != null && _unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("登录")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    //hintText: gm.userNameOrEmail, 出错，暂时取消
                    prefixIcon: Icon(Icons.person),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : "用户名是必填"; // //condition ? expr1 : expr2,如果条件为真，返回expr1，否则返回expr2
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: "密码",
                    //hintText: gm.password,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                //校验密码（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : "密码是必填项";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    textColor: Colors.white,
                    child: Text("登录"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      showLoading(context);
      User user;
      try {
        user = await Git(context)
            .login(_unameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;  // 更新登录用户信息
        // Provider.of<T> 在上下文context 中获取 T 类型的值
      } catch (e) {
        //登录失败则提示
        if (e.response?.statusCode == 401) {  // ?.条件成员访问,跟.差不多,但是最左边的操作数可以为空, e.response可以为空
          showToast("用户名或密码不正确！");
        } else {
          showToast(e.toString());
        }
      } finally {    // finally用来执行那些无论异常是否发生都执行的操作
        // 隐藏loading框
        Navigator.of(context).pop();
      }
      if (user != null) {
        // 返回
        //Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                new MyHomePage(title: "主页",)));
      }
    }
  }
}