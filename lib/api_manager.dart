import 'dart:convert';

import 'package:flutter_app_mobile_final/soccermodel.dart';
import 'package:http/http.dart';

class SoccerApi {
  final String apiUrlLibertadores =
      "https://v3.football.api-sports.io/fixtures?league=13&&season=2023";
  final String apiUrlLigaProfesional =
      "https://v3.football.api-sports.io/fixtures?league=128&&season=2023";
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "8958cddecc779ef9848f8e2edbd1c2d0"
  };

  Future<List<SoccerMatch>> getAllMatches(String opcion) async {
    String apiurl = apiUrlLibertadores;

    if (opcion == "Liga Profesional") {
      apiurl = apiUrlLigaProfesional;
    }

    Response res = await get(Uri.parse(apiurl), headers: headers);
    var body;
    List<SoccerMatch> res1 = [];

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: $body");
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      res1 = matches;
    }
    return res1;
  }
}
