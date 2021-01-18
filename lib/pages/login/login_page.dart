import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login/user_list.dart';

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
          child: UserList(),
        ));
  }
}
