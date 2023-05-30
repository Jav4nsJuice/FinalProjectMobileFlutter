import 'package:flutter/material.dart';
import 'package:flutter_app_mobile_final/goalstat.dart';
import 'package:flutter_app_mobile_final/teamstat.dart';
import 'soccermodel.dart';

Widget matchTileLib(SoccerMatch match) {

  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  homeGoal ??= 0;
  awayGoal ??= 0;

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            match.home.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
        Image.network(
          match.home.logoUrl,
          width: 54.0,
        ),
        Expanded(
          child: Text(
            "$homeGoal - $awayGoal",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        Image.network(
          match.away.logoUrl,
          width: 54.0,
        ),
        Expanded(
          child: Text(
            match.away.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    ),
  );
}

