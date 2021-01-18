import 'package:flutter/material.dart';
import 'package:flutter_music/constant/constant_app.dart';
import 'package:flutter_music/pages/dashboard/dashboard_action_tab.dart';

class PlayingSong extends StatefulWidget {
  @override
  _PlayingSongState createState() => _PlayingSongState();
}

class _PlayingSongState extends State<PlayingSong> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          'Now Playing',
          style: TextStyle(
              fontSize: 15.0,
              color: kPrimaryColor,
              fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.more_horiz,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/fresh_pink.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                        child:
                        Text(
                          'Rewrite the stars',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Icon(
                      Icons.favorite,
                      color: favoriteColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Zac Effron',
                  style: TextStyle(
                      color: kLightColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: LinearProgressIndicator(
                  backgroundColor: kLightColor2,
                  value: 0.6,
                  valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      '04:30',
                      style: TextStyle(
                          color: kLightColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      '06:30',
                      style: TextStyle(
                          color: kLightColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.playlist_add,
                      color: kLightColor,
                      size: 0.09 * size.width,
                    ),
                    Icon(
                      Icons.skip_previous,
                      color: kPrimaryColor,
                      size: 0.12 * size.width,
                    ),
                    Icon(
                      Icons.play_circle_outline,
                      color: kPrimaryColor,
                      size: 0.18 * size.width,
                    ),
                    Icon(
                      Icons.skip_next,
                      color: kPrimaryColor,
                      size: 0.12 * size.width,
                    ),
                    Icon(
                      Icons.swap_horiz,
                      color: kLightColor,
                      size: 0.09 * size.width,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: DashBoardActionTab(),
    );
  }
}
