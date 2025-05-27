import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

class ActivityDetailsHeader extends StatelessWidget {
  const ActivityDetailsHeader({
    super.key,
    required this.from,
    required this.to,
  });

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: NbaTheme.grayThree,
        borderRadius: BorderRadius.all(Radius.circular(131)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Start : $from',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: NbaTheme.white,
            ),
          ),
          if(to != '') ...[
            Text(
            'End : $to',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: NbaTheme.white,
            ),
          ),
          ]
        ],
      ),
    );
  }
}