import 'package:flutter_music/models/tracks.dart';
import 'package:flutter_music/services/tracks_service.dart';
import 'package:mobx/mobx.dart';

part 'tracks_store.g.dart';

class TracksStore = _TracksStore with _$TracksStore;

abstract class _TracksStore with Store {
  final TracksService httpClient = TracksService();

  @observable
  ObservableFuture<List<Tracks>> tracksListFuture;

  @action
  Future fetchTracks() => tracksListFuture = ObservableFuture(httpClient
      .getData('https://api.spotify.com/v1/tracks?ids=2HPmy1uA2SSJVVTduU9g2q%2C2sKF6YGV5am5vI6eycPoQX%2C11dFghVXANMlKmJXsNCbNl%2C7ouMYWpwJ422jRcDASZB7P%2C4VqPOruhp5EdPBeR92t6lQ%2C2takcwOaAZWiXQijPHIx7B&market=ES')
      .then((tracks) => tracks));

  void getTracks() {
    fetchTracks();
  }
}