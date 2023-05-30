import 'package:flutter/material.dart';
import 'package:flutter_app_mobile_final/matchtile.dart';
import 'package:flutter_app_mobile_final/matchtilelib.dart';
import 'package:intl/intl.dart';

import 'goalstat.dart';
import 'soccermodel.dart';

Widget LiberPageBody(List<SoccerMatch> allmatches, Color? backgroundColor) {
  DateTime now = DateTime.now();

  List<SoccerMatch> pastMatches = [];
  List<SoccerMatch> todayMatches = [];
  List<SoccerMatch> futureMatches = [];
  List<SoccerMatch> matchesOrdened = [];

  for (int i = 0; i < allmatches.length; i++) {
    DateTime fecha =
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(allmatches[i].fixture.date);
    if (fecha.isBefore(now)) {
      pastMatches.add(allmatches[i]);
    } else if (fecha.isAfter(now)) {
      futureMatches.add(allmatches[i]);
    } else {
      todayMatches.add(allmatches[i]);
    }
  }

  matchesOrdened.addAll(todayMatches);
  matchesOrdened.addAll(futureMatches);
  matchesOrdened.addAll(pastMatches);

  return Column(
    children: [
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
                const Expanded(
                  flex: 0,
                  child: Text(
                    "Today Matches",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: todayMatches.length,
                    itemBuilder: (context, index) {
                      return matchTileLib(todayMatches[index]);
                    },
                  ),
                ),
                const Expanded(
                  flex: 0,
                  child: Text(
                    "Future Matches",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: futureMatches.length,
                    itemBuilder: (context, index) {
                      return matchTileLib(futureMatches[index]);
                    },
                  ),
                ),
                const Expanded(
                  flex: 0,
                  child: Text(
                    "Past Matches",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pastMatches.length,
                    itemBuilder: (context, index) {
                      return matchTileLib(pastMatches[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
