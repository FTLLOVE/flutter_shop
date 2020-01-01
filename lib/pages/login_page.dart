///
/// @author: FTL
/// @date: 2019-12-31 17:19
/// @desc: 登录页面
///
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes/routers.dart';
import '../navigator/tab_navigator.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController;

  TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: ScreenUtil().setHeight(140),
              child: Image.asset(
                "assets/images/login_logo.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: TextField(
                autofocus: false,
                controller: _usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    hintText: "请输入用户名",
                    hintStyle:
                        TextStyle(color: Color(0xFFBEBEBE), fontSize: 14),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: TextField(
                obscureText: true,
                autofocus: false,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: "请输入密码",
                  hintStyle: TextStyle(color: Color(0xFFBEBEBE), fontSize: 14),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _handleLogin();
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10, right: 10),
                height: ScreenUtil().setHeight(75),
                child: Text(
                  "立即登录",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(30)),
                ),
                decoration: BoxDecoration(
                    color: Color(AppColors.PrimaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleLogin() async {
    FocusScope.of(context).requestFocus(FocusNode());

    String username = _usernameController.text.toString();
    String password = _passwordController.text.toString();

    if (username == "" || username == null) {
      Toast.show("用户名不能为空", context, backgroundRadius: 5);
      return;
    }
    if (password == "" || password == null) {
      Toast.show("密码不能为空", context, backgroundRadius: 5);
      return;
    }
    if (username == "admin" && password == "admin") {
      Toast.show("登录成功", context,
          duration: Toast.LENGTH_LONG, backgroundRadius: 5);
      goPageAndRemoveUntil(context, TabNavigator());
    } else {
      Toast.show("用户名或密码错误", context, backgroundRadius: 5);
      return;
    }
  }
}
