import 'dart:convert';

import 'package:flutter_music/models/tracks.dart';
import 'package:flutter_music/services/token.dart';
import 'package:http/http.dart' as http;

class TracksService {
  List<Tracks> tracks = List();
  String token = Token().token();

  Future getData(String url) async {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      tracks = (data['tracks'] as List).map((json) {
        return Tracks.fromJson(json);
      }).toList();
      return tracks;
    } else {
      print("Error in URL");
    }
  }
}
