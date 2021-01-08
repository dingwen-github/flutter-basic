import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'dart:math';

/// 水滴效果引导页
/// @author: dingwen
/// @date: 2021/1/7

class LiquidSwipeCase extends StatefulWidget {
  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );

  @override
  _LiquidSwipeCaseState createState() => _LiquidSwipeCaseState();
}

class _LiquidSwipeCaseState extends State<LiquidSwipeCase> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: Colors.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'images/sp01.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Hi",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "It's Me",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "Sahdeep",
                style: LiquidSwipeCase.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'images/sp02.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Take a",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "look at",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "Liquid Swipe",
                style: LiquidSwipeCase.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'images/sp03.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Liked?",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "Fork!",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "Give Star!",
                style: LiquidSwipeCase.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.yellowAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'images/sp04.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Can be",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "Used for",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "Onboarding Design",
                style: LiquidSwipeCase.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'images/sp01.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Do",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "Try it",
                style: LiquidSwipeCase.style,
              ),
              Text(
                "Thank You",
                style: LiquidSwipeCase.style,
              ),
            ],
          ),
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            pages: pages,
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
//            positionSlideIcon: 0.5,
            ignoreUserGestureWhileAnimating: true,
//            enableSlideIcon: true,
          ),
//          Padding(
//            padding: EdgeInsets.all(20),
//            child: Column(
//              children: <Widget>[
//                Expanded(child: SizedBox()),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: List<Widget>.generate(pages.length, _buildDot),
//                ),
//              ],
//            ),
//          ),
//          Align(
//            alignment: Alignment.bottomRight,
//            child: Padding(
//              padding: const EdgeInsets.all(25.0),
//              child: FlatButton(
//                onPressed: () {
//                  liquidController.animateToPage(
//                      page: pages.length - 1, duration: 500);
//                },
//                child: Text("Skip to End"),
//                color: Colors.white.withOpacity(0.01),
//              ),
//            ),
//          ),
//          Align(
//            alignment: Alignment.bottomLeft,
//            child: Padding(
//              padding: const EdgeInsets.all(25.0),
//              child: FlatButton(
//                onPressed: () {
//                  liquidController.jumpToPage(
//                      page: liquidController.currentPage + 1);
//                },
//                child: Text("Next"),
//                color: Colors.white.withOpacity(0.01),
//              ),
//            ),
//          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
