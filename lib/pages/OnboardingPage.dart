import 'package:carsi_yeri/constants/const.dart';
import 'package:carsi_yeri/GoToLastPage.dart';
import 'package:flutter/cupertino.dart';
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
  void _onIntroEnd(lastPage) {
    lastPage = pages.length - 1;
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
        body: Center(
      child: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 15,
                fit: FlexFit.tight,
                child: Stack(
                  children: <Widget>[
                    PageView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: pages.length,
                      onPageChanged: (index) {
                        getChangedPageAndMoveBar(index);
                      },
                      controller: controller,
                      itemBuilder: (context, index) {
                        return pages[index];
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            flex: 4,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.width / 2,
                            )),
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                for (int i = 0; i < pages.length; i++)
                                  if (i == _current) ...[circleBar(true)] else
                                    circleBar(false),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.width / 2,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            getChangedPageAndMoveBar(pages.length - 1);
                            controller.animateToPage(pages.length,
                                duration: Duration(milliseconds: 1000),
                                curve: Curves.ease);
                          });
                        },
                        child: Text(
                          onboardingBottomButtonText,
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      )),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    ));
  }
}

List<Widget> pages = [
  //1. page
  Column(
    children: [
      Flexible(
        flex: 14,
        child: Container(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 32),
              child: Image.asset(onboardingPicPath1),
            )),
      ),
      Flexible(
        flex: 2,
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Text(
                onboardingUpText1,
                style: textStyleUp(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Flexible(
        flex: 2,
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                onboardingDownText1,
                style: textStyleDown(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ],
  ),
  //2. Page
  Column(
    children: [
      Flexible(
        flex: 14,
        child: Container(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 32),
              child: Image.asset(onboardingPicPath2),
            )),
      ),
      Flexible(
        flex: 2,
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Text(
                onboardingUpText2,
                style: textStyleUp(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Flexible(
        flex: 2,
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                onboardingDownText2,
                style: textStyleDown(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ],
  ),
  //3. Page
  Column(
    children: [
      Flexible(
        flex: 14,
        child: Container(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 32),
              child: Image.asset(onboardingPicPath3),
            )),
      ),
      Flexible(
        flex: 2,
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Text(
                onboardingUpText3,
                style: textStyleUp(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Flexible(
        flex: 2,
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                onboardingDownText3,
                style: textStyleDown(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ],
  ),
];
