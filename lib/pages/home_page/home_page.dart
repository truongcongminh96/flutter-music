import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music/constant/constant_app.dart';
import 'package:flutter_music/models/song.dart';
import 'package:flutter_music/pages/dashboard/dashboard_navigation.dart';
import 'package:flutter_music/stores/albums_store.dart';
import 'package:flutter_music/models/albums.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final AlbumsStore albumsStore = AlbumsStore();

  @override
  void initState() {
    albumsStore.getAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(
          'Discover',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.account_circle,
              color: kPrimaryColor,
              size: 30,
            ),
          )
        ],
      ),
      body: Container(
          height: size.height,
          child: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Row(
                  children: [
                    _buildNavigationRail(),
                    _buildPlaylistAndSongs(size)
                  ],
                )),
          )),
      bottomNavigationBar: DashBoardNavigation(),
    );
  }

  Widget _buildNavigationRail() {
    return NavigationRail(
      minWidth: 56.0,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      groupAlignment: -0.5,
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle:
          TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      unselectedLabelTextStyle:
          TextStyle(color: kLightColor, fontWeight: FontWeight.bold),
      leading: Column(
        children: [
          Icon(
            Icons.playlist_play,
            color: kPrimaryColor,
          ),
          SizedBox(height: 5.0),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              'Your playlists',
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      destinations: [
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: -1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Recent'),
            ),
          ),
        ),
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: -1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Like'),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPlaylistAndSongs(Size size) {
    final future = albumsStore.albumsListFuture;
    return Column(
      children: [
        Observer(builder: (_) {
          final List<Albums> albumsList = future.result;
          if (future.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              height: size.height / 3,
              width: size.width * 0.8,
              // color: Colors.purple,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: albumsList.length,
                itemBuilder: (context, index) => _buildPlaylistItem(
                    image: albumsList[index].images.first.url,
                    title: albumsList[index].name),
              ),
            );
          }
        }),
        Container(
          height: size.height/2.5,
          width: size.width * 0.8,
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) => _buildSonglistItem(
              image: songs[index].image,
              title: songs[index].songName,
              subtitle: songs[index].artist,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPlaylistItem({String title, String image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.orange,
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(child: Container(height: 0)),
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Icon(
                Icons.play_circle_outline,
                color: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSonglistItem({String image, String title, String subtitle}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
