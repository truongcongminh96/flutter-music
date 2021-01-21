import 'package:flutter/material.dart';
import 'package:flutter_music/pages/home_page/home_page.dart';
import 'package:flutter_music/pages/night_city/navigation_night_city.dart';
import 'package:flutter_music/widgets/rounded_button.dart';

class MusicSplashScreen extends StatefulWidget {
  @override
  _MusicSplashScreenState createState() => _MusicSplashScreenState();
}

class _MusicSplashScreenState extends State<MusicSplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Bitmap.png'), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.headline2,
                    children: [
                      TextSpan(text: "Flutter"),
                      TextSpan(
                          text: "Music",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: RoundedButton(
                  text: "Get started",
                  fontSize: 20,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: RoundedButton(
                  text: "Go to Night City",
                  fontSize: 20,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NavigationNightCity();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
