import 'dart:ui';

import 'package:carsi_yeri/constants/const.dart';
import 'package:carsi_yeri/main.dart';

import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

int _current = 0;

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = new PageController();

//Geç butonu basıldığında sayfayı bitiriyor.
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

//sayfa index'i ile indicators durumunu senkronize ediyoruz.
  void getChangedPageAndMoveBar(int page) {
    _current = page;
    setState(() {});
  }

//dots indicators objesi
  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: isActive ? 8 : 8,
      width: isActive ? 8 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.zero,
          child: Container(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                PageView.builder(
                  // physics: ClampingScrollPhysics(),
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    getChangedPageAndMoveBar(index);
                  },
                  controller: controller,
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 289),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < pages.length; i++)
                            if (i == _current) ...[circleBar(true)] else
                              circleBar(false),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          getChangedPageAndMoveBar(pages.length - 1);
                          Navigator.pop(context);
                          _onIntroEnd(context);
                          controller.addListener(() {});
                        });
                        //GEÇ Butonu basıldığında yapılacaklar...
                      },
                      child: Text(
                        onboardingBottomButtonText,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

List<Widget> pages = [
  Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
              margin: EdgeInsets.only(top: 32),
              child: Image.asset(onboardingPicPath1)),
        ),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Text(
              onboardingUpText1,
              style: textStyleUp(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Text(
              onboardingDownText1,
              style: textStyleDown(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  ),
  Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
              margin: EdgeInsets.only(top: 32),
              child: Image.asset(onboardingPicPath2)),
        ),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Text(
              onboardingUpText2,
              style: textStyleUp(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Text(
              onboardingDownText2,
              style: textStyleDown(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  ),
  Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
              margin: EdgeInsets.only(top: 32),
              child: Image.asset(onboardingPicPath3)),
        ),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Text(
              onboardingUpText3,
              style: textStyleUp(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Text(
              onboardingDownText3,
              style: textStyleDown(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  ),
];
