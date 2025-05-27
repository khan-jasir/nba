import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivityReportHeader extends StatelessWidget {
  const ActivityReportHeader({
    super.key,
    required this.totalActivities,
    required this.activitiesClosed
  });

  final int activitiesClosed;
  final int totalActivities;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xff1A2A30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderWidgets(
            icon: 'assets/icons/activity_closed.svg',
            total: totalActivities,
            current: activitiesClosed,
            title: 'Activites Closed',
          ),
          HeaderWidgets(
            icon: 'assets/icons/sales_month.svg',
            total: 10,
            current: 5,
            title: 'Sales This Month',
          ),
          HeaderWidgets(
            icon: 'assets/icons/productivity_rank.svg',
            total: 20,
            current: 8,
            title: 'Productivity Rank',
            isProductivityRank: true,
          ),
        ],
      ),
    );
  }
}

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({
    super.key,
    required this.icon,
    required this.total,
    required this.current,
    required this.title,
    this.isProductivityRank = false
  });

  final String icon;
  final int total;
  final int current;
  final String title;
  final bool isProductivityRank;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon, width: 20, height: 20, package: 'nba_sdk',),
            SizedBox(width: 5),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: isProductivityRank ? '#$current' :'$current',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '/$total',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xff94A3B8),
          ),
        )
      ],
    );
  }
}