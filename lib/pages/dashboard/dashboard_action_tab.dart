import 'package:flutter/material.dart';
import 'package:flutter_music/constant/constant_app.dart';

class DashBoardActionTab extends StatefulWidget{
  @override
  _DashBoardActionTabState createState() => _DashBoardActionTabState();
}

class _DashBoardActionTabState extends State<DashBoardActionTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add_chart,
            color: kLightColor,
          ),
          Icon(
            Icons.playlist_play,
            color: kLightColor,
          ),
          Icon(
            Icons.favorite,
            color: favoriteColor,
          )
        ],
      ),
    );
  }
}