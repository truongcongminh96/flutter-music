import 'package:flutter/material.dart';
import 'package:flutter_music/pages/home_page/home_page.dart';
import 'package:flutter_music/pages/login/login_page.dart';
import 'package:flutter_music/pages/playing_song/playing_song.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.mcLarenTextTheme(Theme.of(context).textTheme)),
      home: LoginPage(),
      routes: {
        '/song': (context) => PlayingSong()
      },
    );
  }
}
