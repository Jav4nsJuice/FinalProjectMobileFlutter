import 'package:flutter/material.dart';
import 'package:flutter_app_mobile_final/matchtile.dart';
import 'package:flutter_app_mobile_final/matchtilelib.dart';

import 'goalstat.dart';
import 'soccermodel.dart';

Widget LiberPageBody(List<SoccerMatch> allmatches, Color? backgroundColor) {
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
                Expanded(
                  child: ListView.builder(
                    itemCount: allmatches.length,
                    itemBuilder: (context, index) {
                      return matchTileLib(allmatches[index]);
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
