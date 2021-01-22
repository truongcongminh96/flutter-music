import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/mock/mock_night_city.dart';
import 'package:flutter_music/pages/night_city/header_night_city.dart';
import 'package:flutter_music/pages/radio/radio.dart';
import 'package:flutter_music/widgets/night_city/widgets.dart';

class NightCity extends StatefulWidget {
  const NightCity({Key key}) : super(key: key);

  @override
  _NightCityState createState() => _NightCityState();
}

class _NightCityState extends State<NightCity> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RadioFm();
              },
            ),
          );
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50.0),
        child: CustomAppBar(scrollOffset: _scrollOffset),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                  key: PageStorageKey('previews'),
                  title: 'Previews',
                  contentList: previews),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(title: 'My list', contentList: myList),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                key: PageStorageKey('originals'),
                title: 'Netflix Originals',
                contentList: originals,
                isOriginals: true),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey('trending'),
                  title: 'Trending',
                  contentList: trending),
            ),
          )
        ],
      ),
    );
  }
}
