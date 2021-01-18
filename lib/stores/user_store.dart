import 'package:flutter_music/services/user_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_music/models/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserService httpClient = UserService();

  @observable
  ObservableFuture<List<User>> userListFuture;

  @action
  Future fetchUsers() => userListFuture = ObservableFuture(httpClient
      .getData('https://reqres.in/api/users?page=1')
      .then((users) => users));

  void getTheUsers() {
    fetchUsers();
  }
}