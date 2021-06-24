import 'package:flutter/material.dart';

import '../constants/const.dart';
import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage(this.title);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            style: TextStyle(color: Colors.white, fontSize: 16.0),
            obscureText: isPassword,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              labelText: title,
              hintText: title + " giriniz.",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              border: UnderlineInputBorder(borderSide: BorderSide()),
            ),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Row(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            alignment: Alignment.center,
            width: 150,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: loginButtonBorderStyle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lightBlueAccent, Colors.blueAccent])),
            child: TextButton(
              child: Center(
                child: Text(
                  "Kayıt ol",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Zaten hesabınız var mı ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Giriş Yap',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // var img = logoImgPath;
  // Widget _title() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Image.asset(
  //         img,
  //         fit: BoxFit.contain,
  //         width: 200,
  //         height: 100,
  //       ),
  //       Text("Sign Up")
  //     ],
  //   );
  // }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Kullanıcı adı"),
        _entryField("Email"),
        _entryField("Parola", isPassword: true),
        _entryField("Parola Tekrar", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // _title(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.22),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: _emailPasswordWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _submitButton(),
            SizedBox(height: 20),
            Expanded(child: _loginAccountLabel()),
          ],
        ),
      ),
    );
  }
}
