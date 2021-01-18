import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/constant/constant_app.dart';

class DashBoardNavigation extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardNavigation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 120.0,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: kSecondaryColor),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.0),
            _buildCurrentPlayingSong(),
            SizedBox(height: 8.0),
            Container(
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: kWhiteColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.home,
                      color: kLightColor,
                    ),
                    Icon(
                      Icons.search_outlined,
                      color: kLightColor,
                    ),
                    Icon(
                      Icons.playlist_play,
                      color: kLightColor,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: kLightColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCurrentPlayingSong() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/song');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        child: Row(
          children: [
            CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/colors.jpg')),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rewrite the stars',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    'Zac Effron',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kLightColor2, fontSize: 12),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Icon(
              Icons.favorite_border,
              color: kPrimaryColor,
            ),
            SizedBox(width: 10.0),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.0),
                  color: Colors.white),
              child: Icon(
                Icons.pause,
                color: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
