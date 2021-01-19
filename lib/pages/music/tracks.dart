import 'package:flutter/material.dart';
import 'package:flutter_music/models/song.dart';
import 'package:flutter_music/stores/tracks_store.dart';

class TrackList extends StatefulWidget {
  @override
  _TrackListState createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  final TracksStore tracksStore = TracksStore();

  @override
  void initState() {
    tracksStore.getTracks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final albumsListFuture = tracksStore.tracksListFuture;
    return
      ListView.builder(
        itemCount: songs.length ?? 0,
        itemBuilder: (context, index) => _buildSonglistItem(
          image: songs[index].image,
          title: songs[index].songName,
          subtitle: songs[index].artist,
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
