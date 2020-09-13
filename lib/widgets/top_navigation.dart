import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 顶部导航 PageView
class TopNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: Choice.choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Top Navigation'),
            bottom: TabBar(
              isScrollable: true,
              tabs: Choice.choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: Choice.choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
  static const List<Choice> choices = const <Choice>[
    const Choice(title: 'car', icon: Icons.directions_car),
    const Choice(title: 'bicycle', icon: Icons.directions_bike),
    const Choice(title: 'boat', icon: Icons.directions_boat),
    const Choice(title: 'bus', icon: Icons.directions_bus),
    const Choice(title: 'train', icon: Icons.directions_transit),
    const Choice(title: 'walk', icon: Icons.directions_walk)
  ];
}

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            choice.icon,
            size: 128.0,
            color: textStyle.color,
          ),
          Text(
            choice.title,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
