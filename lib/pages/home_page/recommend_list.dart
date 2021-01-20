import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music/models/shows.dart';
import 'package:flutter_music/pages/podcasts/index.dart';
import 'package:flutter_music/stores/shows_store.dart';
import 'package:flutter_music/widgets/list_card.dart';
import 'package:mobx/mobx.dart';

class RecommendList extends StatefulWidget {
  @override
  _RecommendListState createState() => _RecommendListState();
}

class _RecommendListState extends State<RecommendList> {
  final ShowsStore showsStore = ShowsStore();

  @override
  void initState() {
    showsStore.getShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final showsListFuture = showsStore.showsListFuture;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 285,
          width: size.width,
          child: Observer(builder: (_) {
            final List<Shows> showsList = showsListFuture.result;
            if (showsListFuture.status != FutureStatus.pending) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: showsList.length,
                  itemBuilder: (context, index) => ListCard(
                      image: showsList[index].images.first.url,
                      title: showsList[index].name,
                      auth: showsList[index].publisher,
                      rating: 4.9,
                      pressDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PodCasts(shows: showsList[index]),
                          ),
                        );
                      }));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
  }
}
