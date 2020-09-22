import 'package:flutter/material.dart';
import 'package:flutter_basic/case/tabbar-bottomnavigationbar/route_basic_data_page.dart';

class SetTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MeContent();
  }
}

class MeContent extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("路由"),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return RouteBasicDataPage();
                  }));
                },
                child: Text("基本路由:不传值"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return RouteBasicDataPage(title: "基本路由传值");
                  }));
                },
                child: Text("基本路由:传值"),
              ),
              RaisedButton(
                onPressed: () {
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (BuildContext context) {
//                return RouteNamedPage();
//              }));
                  Navigator.pushNamed(context, '/routeNamedPage');
                },
                child: Text("命名路由:不传值"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/routeNamedPage',
                      arguments: "命名路由:传值");
                },
                child: Text("命名路由:传值"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/routeB_Page');
                },
                child: Text("替换路由"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/routeB_Page');
                },
                child: Text("返回根路由"),
              ),
            ],
          )),
    );
  }
}
