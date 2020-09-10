import 'package:flutter/material.dart';

class MeTabPage extends StatefulWidget {
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                icon: Icon(Icons.dashboard, color: Colors.white),
                onPressed: null);
          }),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Android",
              ),
              Tab(
                text: "Flutter",
              ),
              Tab(
                text: "Java",
              ),
              Tab(
                text: "C++",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Text("Android"),
          ),
          Center(
            child: Text("Flutter"),
          ),
          Center(
            child: Text("Java"),
          ),
          Center(
            child: Text("C++"),
          ),
        ]),
      ),
    );
  }
}
