import 'package:carsi_yeri/constants/const.dart';
import 'package:carsi_yeri/pages/OnboardingPage.dart';
import 'package:flutter/material.dart';

import '../Pages/ForgetPassword.dart';

import '../Pages/SignUp.dart';

bool _isValidUserText = true;
bool _isValidPassText = true;

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  GlobalKey<FormState> _textFormKey = new GlobalKey<FormState>();
  GlobalKey<FormState> _passFormKey = new GlobalKey<FormState>();

  String _hintTextPass = "Parola Gir";
  String _hintTextUser = "Kullanıcı Bilgisi Gir";
  String _errorTextUser = "Kullanıcı Adınızı Giriniz!";
  String _errorTextPass = "Şifrenizi Giriniz!";
  bool _show = false;
  Icon _userIcon = Icon(Icons.account_box, color: Colors.white);
  Icon _passIcon = Icon(Icons.lock_outline_rounded, color: Colors.white);

  bool _isPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Container(
              color: Colors.blue[500],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Center(child: mylogo), // üst Kısım
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.22),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Form(
                              onChanged: () {
                                setState(() {
                                  _isValidUserText = true;
                                });
                              },
                              key: _textFormKey,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                child: TextFormField(
                                  controller: _userController,
                                  minLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.left,
                                  obscureText: false,
                                  autocorrect: false,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    errorText: (_isValidUserText
                                        ? null
                                        : _errorTextUser),
                                    suffixIcon: null,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    prefixIcon: IconButton(
                                      icon: _userIcon,
                                      color: Colors.white,
                                      onPressed: null,
                                    ),
                                    hintText: _hintTextUser,
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            //2. text alanı
                            Form(
                              onChanged: () {
                                setState(() {
                                  _isValidPassText = true;
                                });
                              },
                              key: _passFormKey,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                child: TextFormField(
                                  controller: _passController,
                                  minLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.left,
                                  obscureText: !_show,
                                  autocorrect: false,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    errorText: (_isValidPassText
                                        ? null
                                        : _errorTextPass),
                                    suffixIcon: (_isPass == true
                                        ? IconButton(
                                            icon: (_show
                                                ? Icon(Icons.visibility_off)
                                                : Icon(Icons.visibility_sharp)),
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {
                                                _show
                                                    ? _show = false
                                                    : _show = true;
                                              });
                                            },
                                          )
                                        : null),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    prefixIcon: _passIcon,
                                    hintText: _hintTextPass,
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // FormFieldLogin(_textKey, _passKey),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 6.0, left: 4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.blue.shade900.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )),
                              width: 80,
                              height: 40,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpPage("heyy"),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Kayıt ol",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )))),
                      // SignUp(),
                      Padding(
                          padding: const EdgeInsets.only(top: 6.0, left: 4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.blue.shade900.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              width: 140,
                              height: 40,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            new ForgetPasswordForm(
                                          title: '',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Şifremi unuttum",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )))),
                      // ForgetPassword(),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: loginButtonBorderStyle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ])),
                          width: 150,
                          height: 100,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_userController.text == "") {
                                  _isValidUserText = false;
                                }
                                if (_passController.text == "") {
                                  _isValidPassText = false;
                                } else {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OnboardingScreen()));
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                loginText,
                                style: TextStyle(
                                    fontSize: 22.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // LoginButton(_textKey, _passKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
