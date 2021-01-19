import 'package:flutter/material.dart';
import 'package:flutter_music/pages/music/index.dart';
import 'package:flutter_music/widgets/list_card.dart';

class RecommendList extends StatefulWidget {
  @override
  _RecommendListState createState() => _RecommendListState();
}

class _RecommendListState extends State<RecommendList> {
  @override
  Widget build(BuildContext context) {
    return                   SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ListCard(
            image: "assets/images/book-1.png",
            title: "Crushing & Influence",
            auth: "Gary Venchuk",
            rating: 4.9,
            pressDetails: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MusicPage();
                  },
                ),
              );
            },
          ),
          ListCard(
            image: "assets/images/book-2.png",
            title: "Top Ten Business Hacks",
            auth: "Herman Joel",
            rating: 4.8,
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
