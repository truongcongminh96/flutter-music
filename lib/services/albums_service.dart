import 'dart:convert';
import 'dart:io';

import 'package:flutter_music/models/albums.dart';
import 'package:http/http.dart' as http;

class AlbumsService {
  List<Albums> albums = List();
var token = 'BQB5nraumb7ofRbngqp4_AbQfsIoxcMlK3asvEsC1pxIk-E8MZj12SlxdOpzygSVQTo_CNe70OXdj-u3yCBnmAPGbZi8oVZ6H8YiVsNEQFn-vNvMpr36YCKfXgwNXbxnl5Em_3Ik90rkItZ6H5ikUx3sr24_1osHh2Epald-RG9kzMvLTsdMY_J2Nyc_VCM2ulYeCBLq9NzruC88NGfBZtIawytmkXSwmVhXQ1dN857niS1tp88DReu2vlbPCoPwzep_02gi-Qy-Dc0OFfSmHfFHQF6Q6MOo9LE';

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
