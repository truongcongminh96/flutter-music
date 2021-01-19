import 'package:flutter/material.dart';
import 'package:flutter_music/widgets/episodes_card.dart';

class Episodes extends StatefulWidget {
  @override
  _EpisodesState createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * .48 - 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          EpisodesCard(
            name: "Money",
            chapterNumber: 1,
            tag: "Life is about change",
            press: () {},
          ),
          EpisodesCard(
            name: "Power",
            chapterNumber: 2,
            tag: "Everything loves power",
            press: () {},
          ),
          EpisodesCard(
            name: "Influence",
            chapterNumber: 3,
            tag: "Influence easily like never before",
            press: () {},
          ),
          EpisodesCard(
            name: "Win",
            chapterNumber: 4,
            tag: "Winning is what matters",
            press: () {},
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

