import 'dart:convert';

import 'package:flutter_music/models/albums.dart';
import 'package:flutter_music/services/token.dart';
import 'package:http/http.dart' as http;

class AlbumsService {
  List<Albums> albums = List();
  String token = Token().token();

  Future getData(String url) async {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      albums = (data['albums'] as List).map((json) {
        return Albums.fromJson(json);
      }).toList();
      return albums;
    } else {
      print("Error in URL");
    }
  }
}
