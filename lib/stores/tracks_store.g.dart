// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TracksStore on _TracksStore, Store {
  final _$tracksListFutureAtom = Atom(name: '_TracksStore.tracksListFuture');

  @override
  ObservableFuture<List<Tracks>> get tracksListFuture {
    _$tracksListFutureAtom.reportRead();
    return super.tracksListFuture;
  }

  @override
  set tracksListFuture(ObservableFuture<List<Tracks>> value) {
    _$tracksListFutureAtom.reportWrite(value, super.tracksListFuture, () {
      super.tracksListFuture = value;
    });
  }

  final _$_TracksStoreActionController = ActionController(name: '_TracksStore');

  @override
  Future<dynamic> fetchTracks() {
    final _$actionInfo = _$_TracksStoreActionController.startAction(
        name: '_TracksStore.fetchTracks');
    try {
      return super.fetchTracks();
    } finally {
      _$_TracksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tracksListFuture: ${tracksListFuture}
    ''';
  }
}
