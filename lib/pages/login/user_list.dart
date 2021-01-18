import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_music/stores/user_store.dart';
import 'package:flutter_music/models/user.dart';

class UserList extends StatelessWidget {
  final UserStore store = UserStore();

  UserList() {
    store.getTheUsers();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.userListFuture;

    return Observer(
      builder: (_) {
        final List<User> users = future.result;
        print(future.status == FutureStatus.pending);
        if (future.status == FutureStatus.pending) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                    radius: 25,
                  ),
                  title: Text(
                    user.name,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    user.email,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  trailing: Text(
                    user.followers.toString(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                );
              },
            ),
          );
        }

      },
    );
  }

  Future _refresh() => store.fetchUsers();
}
