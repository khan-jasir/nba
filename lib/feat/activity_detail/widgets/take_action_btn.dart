import 'package:flutter/material.dart';

class TakeActionBtn extends StatelessWidget {
  const TakeActionBtn({
    super.key,
    required this.title,
    this.height,
    this.onPressed,
  });

  final String title;
  final double? height;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed?.call(),
      child: Container(
        width: double.infinity,
        height: height ?? 36,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Color(0xff0E86A6),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}