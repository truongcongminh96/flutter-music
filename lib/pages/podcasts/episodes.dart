import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music/stores/shows_store.dart';
import 'package:flutter_music/widgets/episodes_card.dart';
import 'package:mobx/mobx.dart';

class Episodes extends StatefulWidget {
  final String showId;

  const Episodes({Key key, this.showId}) : super(key: key);

  @override
  _EpisodesState createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {

  final ShowsStore showsStore = ShowsStore();

  @override
  void initState() {
    showsStore.getEpisodesShow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final episodesListFuture = showsStore.episodesListFuture;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * .48 - 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Observer(builder: (_) {
          //   final episodesList = episodesListFuture.result;print(episodesList.total);
          //   if (episodesListFuture.status != FutureStatus.pending) {
          //     return Container(
          //       height: size.height/3,
          //       width: size.width,
          //       child: ListView.builder(
          //           scrollDirection: Axis.vertical,
          //           itemCount: episodesList.total,
          //           itemBuilder: (context, index) => EpisodesCard(
          //             name: episodesList.items[index].name,
          //             chapterNumber: 1,
          //             tag: "Life is about change",
          //             press: () {},
          //           )
          //       ),
          //     );
          //   } else {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );}
          // }),
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
            tag: "Influence easily",
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
