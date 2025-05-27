
import 'package:flutter/material.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 0.5,
            endIndent: 12,
          ),
        ),
        Text(
          date,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 0.5,
            indent: 12,
          ),
        ),
      ],
    );
  }
}
