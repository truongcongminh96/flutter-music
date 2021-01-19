import 'package:flutter_music/models/shows.dart';
import 'package:flutter_music/services/shows_service.dart';
import 'package:mobx/mobx.dart';

part 'shows_store.g.dart';

class ShowsStore = _ShowsStore with _$ShowsStore;

abstract class _ShowsStore with Store {
  final ShowsService httpClient = ShowsService();

  @observable
  ObservableFuture<List<Shows>> showsListFuture;

  @action
  Future fetchShows() => showsListFuture = ObservableFuture(httpClient
      .getData('https://api.spotify.com/v1/shows?ids=5Jv8JCo6QZcTBJBJP4YxhS%2C5NklUzf5uL4lSMQHwiIwdE%2C4S6f4GuS4XZgyM34AgMHH2&market=ES')
      .then((shows) => shows));

  void getShows() {
    fetchShows();
  }
}