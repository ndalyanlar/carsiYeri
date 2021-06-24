import 'package:flutter/material.dart';

import '../constants/const.dart';
import 'LoginPage.dart';

class ForgetPasswordForm extends StatefulWidget {
  ForgetPasswordForm({this.title});
  final String title;
  @override
  _ForgetPasswordFormState createState() => new _ForgetPasswordFormState();
}

TextEditingController txtctr = new TextEditingController();

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  // var img = logoImgPath;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String checkValid(bool isValid) {
    return (isValid ? null : "Kullanıcı Adı veya E-posta adresinizi Giriniz.");
  }

  bool isValid = true;
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
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset(
                        //   img,
                        //   fit: BoxFit.contain,
                        //   width: 200,
                        //   height: 100,
                        // ),
                        Text(
                          "Password",
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
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
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                  child: TextFormField(
                                    onChanged: (String value) {
                                      setState(() {
                                        (value != null || value != "")
                                            ? isValid = true
                                            : isValid = false;
                                      });
                                    },
                                    controller: txtctr,
                                    minLines: 1,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.left,
                                    autocorrect: false,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      errorText: checkValid(isValid),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.email),
                                        color: Colors.white,
                                        onPressed: null,
                                      ),
                                      hintText: "E posta veya Telefon giriniz.",
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
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
                                if (txtctr.text == "") {
                                  isValid = false;
                                } else {
                                  isValid = true;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                "Gönder",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              topLeft: Radius.circular(40))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Giriş Yap",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
