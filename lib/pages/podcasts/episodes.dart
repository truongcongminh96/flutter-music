import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music/pages/music/index.dart';
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
    showsStore.getEpisodesShow(widget.showId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final episodesListFuture = showsStore.episodesListFuture;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * .45 - 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Observer(builder: (_) {
            final episodesList = episodesListFuture.result;
            if (episodesListFuture.status != FutureStatus.pending) {
              return Container(
                height: size.height / 3,
                width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: episodesList.items.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            EpisodesCard(
                              imageUrl:
                                  episodesList.items[index].images.first.url,
                              name: episodesList.items[index].name,
                              chapterNumber: 1,
                              tag: episodesList.items[index].description,
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MusicPage();
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        )),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
