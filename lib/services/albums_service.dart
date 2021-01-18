import 'dart:convert';

import 'package:flutter_music/models/albums.dart';
import 'package:http/http.dart' as http;

class AlbumsService {
  List<Albums> albums = List();
var token = 'BQAcLFe_Mo-Q11o5kFkFh_uRLbke-kSmQbwA7rqlXUAwBs1DE1_DLIwlM29OjYBUKlw4pNHBvdxOGhm9T0ibKZ5mm_fRr5h7GCmHHETMTep48KRcISbnQ-ZC0qhmA9Z3-dl_dRSJ4zNf1ZWjqJSmuZJsxgGCy2KXZXD_0pZZK5g6OvZu_GAtyPUa0GZF5CCndZcsoReFu3H07OZqquIJfk2xCeACyJhHHOaAsli1KmUYDoH-7Pp40pWiBDs_RtVSoyOY245nXOmXfIQzBviUtnqhoC38wlgM0A0';

Future getData(String url) async {
    print(token);
    print(url);
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
