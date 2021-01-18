// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlbumsStore on _AlbumsStore, Store {
  final _$albumsListFutureAtom = Atom(name: '_AlbumsStore.albumsListFuture');

  @override
  ObservableFuture<List<Albums>> get albumsListFuture {
    _$albumsListFutureAtom.reportRead();
    return super.albumsListFuture;
  }

  @override
  set albumsListFuture(ObservableFuture<List<Albums>> value) {
    _$albumsListFutureAtom.reportWrite(value, super.albumsListFuture, () {
      super.albumsListFuture = value;
    });
  }

  final _$_AlbumsStoreActionController = ActionController(name: '_AlbumsStore');

  @override
  Future<dynamic> fetchAlbums() {
    final _$actionInfo = _$_AlbumsStoreActionController.startAction(
        name: '_AlbumsStore.fetchAlbums');
    try {
      return super.fetchAlbums();
    } finally {
      _$_AlbumsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
albumsListFuture: ${albumsListFuture}
    ''';
  }
}
