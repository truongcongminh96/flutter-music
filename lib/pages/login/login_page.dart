import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/home_page/home_page.dart';
import 'package:flutter_music/pages/login/user_list.dart';
import 'package:flutter_music/widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
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
        ],
      ),
    ));
  }
}
