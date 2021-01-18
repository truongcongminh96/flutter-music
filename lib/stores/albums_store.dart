import 'package:flutter_music/models/albums.dart';
import 'package:flutter_music/services/albums_service.dart';
import 'package:mobx/mobx.dart';

part 'albums_store.g.dart';

class AlbumsStore = _AlbumsStore with _$AlbumsStore;

abstract class _AlbumsStore with Store {
  final AlbumsService httpClient = AlbumsService();

  @observable
  ObservableFuture<List<Albums>> albumsListFuture;

  @action
  Future fetchAlbums() => albumsListFuture = ObservableFuture(httpClient
      .getData('https://api.spotify.com/v1/albums?ids=382ObEPsp2rxGrnsizN5TX%2C1A2GTWGtFfWp7KSQTwWOyo%2C2noRn2Aes5aoNVsU6iWThc&market=ES')
      .then((albums) => albums));

  void getAlbums() {
    fetchAlbums();
  }
}