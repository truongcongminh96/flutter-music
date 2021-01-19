// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shows_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShowsStore on _ShowsStore, Store {
  final _$showsListFutureAtom = Atom(name: '_ShowsStore.showsListFuture');

  @override
  ObservableFuture<List<Shows>> get showsListFuture {
    _$showsListFutureAtom.reportRead();
    return super.showsListFuture;
  }

  @override
  set showsListFuture(ObservableFuture<List<Shows>> value) {
    _$showsListFutureAtom.reportWrite(value, super.showsListFuture, () {
      super.showsListFuture = value;
    });
  }

  final _$_ShowsStoreActionController = ActionController(name: '_ShowsStore');

  @override
  Future<dynamic> fetchShows() {
    final _$actionInfo = _$_ShowsStoreActionController.startAction(
        name: '_ShowsStore.fetchShows');
    try {
      return super.fetchShows();
    } finally {
      _$_ShowsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showsListFuture: ${showsListFuture}
    ''';
  }
}
