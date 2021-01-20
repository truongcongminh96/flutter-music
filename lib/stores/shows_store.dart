import 'package:flutter_music/models/episodes.dart';
import 'package:flutter_music/models/shows.dart';
import 'package:flutter_music/services/shows_service.dart';
import 'package:mobx/mobx.dart';

part 'shows_store.g.dart';

class ShowsStore = _ShowsStore with _$ShowsStore;

abstract class _ShowsStore with Store {
  final ShowsService httpClient = ShowsService();

  @observable
  ObservableFuture<List<Shows>> showsListFuture;

  @observable
  ObservableFuture<Episodes> episodesListFuture;

  @action
  Future fetchShows() => showsListFuture = ObservableFuture(httpClient
      .getData(
          'https://api.spotify.com/v1/shows?ids=6IOcX7Ml43BNThbh4Kplet%2C5NklUzf5uL4lSMQHwiIwdE%2C3RvksD9WQxXdHkdX6Z176N%2C5Jv8JCo6QZcTBJBJP4YxhS%2C4S6f4GuS4XZgyM34AgMHH2&market=ES')
      .then((shows) => shows));

  @action
  Future fetchEpisodesShow(String showId) =>
      episodesListFuture = ObservableFuture(httpClient
          .getAllEpisodes(
              'https://api.spotify.com/v1/shows/$showId/episodes?market=ES')
          .then((episodes) => episodes));

  void getEpisodesShow(String showId) {
    fetchEpisodesShow(showId);
  }

  void getShows() {
    fetchShows();
  }
}
