import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';


class TakeActionSheet extends StatelessWidget {
  const TakeActionSheet({super.key, required this.onNoticeReminderPressed, required this.onRequestClosurePressed});

  final Function() onNoticeReminderPressed;
  final Function() onRequestClosurePressed; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff1A2A30),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Take Action',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: NbaTheme.white,
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: onNoticeReminderPressed,
            child: Text(
              'SEND NOTICE REMINDER TO CUSTOMER',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: NbaTheme.primaryBright,
              ),
            ),
          ),
          SizedBox(height: 15,),
          Divider(color: Colors.white, height: 0.1,),
           SizedBox(height: 20),
          GestureDetector(
            onTap: onRequestClosurePressed,
            child: Text(
              'REQUEST CLOSURE',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: NbaTheme.primaryBright,
              ),
            ),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}