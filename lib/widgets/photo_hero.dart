import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

///Flutter hero 动画
class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///速度
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Hero Animation'),
        leading: BackButton(),
      ),
      body: Center(
        child: PhotoHero(
          photo:
          'https://pics2.baidu.com/feed/aa64034f78f0f736de90e1b9a1a6f01eeac41312.jpeg?token=ab24240c8daec27fc6d809a1236816a6',
          width: 300.0,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Flippers Page'),
                  leading: BackButton(),
                ),
                body: Container(
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo:
                    'https://pics2.baidu.com/feed/aa64034f78f0f736de90e1b9a1a6f01eeac41312.jpeg?token=ab24240c8daec27fc6d809a1236816a6',
                    width: 100.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}
