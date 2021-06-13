import 'package:carsi_yeri/OnboardingPage.dart';
import 'package:carsi_yeri/main.dart';
import 'package:flutter/material.dart';

class GoToLastPage extends StatefulWidget {
  GoToLastPage({Key key}) : super(key: key);

  @override
  State<GoToLastPage> createState() => _GoToLastPageState();
}

class _GoToLastPageState extends State<GoToLastPage> {
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
                    pages[pages.length - 1],
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
                                  if (i == pages.length - 1) ...[
                                    circleBar(true)
                                  ] else
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
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => HomePage()),
                    );
                  },
                ),
                flex: 2,
                fit: FlexFit.tight,
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
