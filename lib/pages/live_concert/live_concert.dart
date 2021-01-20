import 'package:flutter/material.dart';
import 'package:flutter_music/constant/constant_app.dart';
import 'package:flutter_svg/svg.dart';

class LiveConcert extends StatefulWidget {
  @override
  _LiveConcertState createState() => _LiveConcertState();
}

class _LiveConcertState extends State<LiveConcert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            padding: EdgeInsets.only(left: kDefaultPadding),
            icon: SvgPicture.asset('assets/icons/menu.svg'),
            onPressed: () {}),
        actions: [
          IconButton(icon: SvgPicture.asset('assets/icons/search.svg'), onPressed: () {})
        ],
      ),
    );
  }
}
