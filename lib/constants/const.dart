import 'package:flutter/material.dart';

//Paths
String onboardingPicPath1 = "images/onboarding_1.png";
String onboardingPicPath2 = "images/onboarding_2.png";
String onboardingPicPath3 = "images/onboarding_3.png";

//Strings
final String userText = "E-Posta veya Telefon";
final String passText = "Parola";
final String loginText = "Giriş";
const String AppName = "ÇarşıYeri";
final String onboardingBottomButtonText = "GEÇ";
final String userName = "admin";
final String pass = "admin";

final String onboardingUpText1 = "ÇarşıYeri ile çarşı hizmeti evinizde!";
final String onboardingUpText2 = "Sepetinizi oluşturun";
final String onboardingUpText3 = "Siparişiniz eve gelsin";
final String onboardingDownText1 = """Çarşıya çıkmanıza gerek kalmadan, 
çarşı esnafından dilediğiniz gibi 
alışverişinizi yapabileceksniz.""";
final String onboardingDownText2 = """Evinizden, işyerinizden online şekilde 
siparişinizi oluşturun.""";
final String onboardingDownText3 =
    """Her zaman güvenle alışverişinizi yaptığınız çarşı
esnafından, siparişleriniz evinize gelsin.""";

TextStyle textStyleUp({fontSize = 22.0, color = Colors.black}) => TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
TextStyle textStyleDown({fontSize = 18.0, color = Colors.black}) => TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );

TextStyle textStyle({fontSize: double, color: Color}) => TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
BorderRadius get loginButtonBorderStyle => BorderRadius.only(
      bottomRight: Radius.circular(100),
      topLeft: Radius.circular(100),
    );
