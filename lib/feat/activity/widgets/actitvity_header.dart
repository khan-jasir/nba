import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
class ActivityHeader extends StatelessWidget {
  final bool isExpanded;
  final ActivityBuckets bucket;
  const ActivityHeader({super.key, required this.isExpanded, required this.bucket});


  Widget _getIcon() {
    if(bucket == ActivityBuckets.high) {
      return SvgPicture.asset('assets/icons/high.svg', width: 20, height: 20, package: 'nba_sdk');
    } else if(bucket == ActivityBuckets.medium) {
      return SvgPicture.asset('assets/icons/medium.svg', width: 20, height: 20, package: 'nba_sdk');
    } else {
      return SvgPicture.asset('assets/icons/low.svg', width: 20, height: 20, package: 'nba_sdk');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          _getIcon(),
          Gap(10),
          Text(bucket.value.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white)),
          Spacer(),
          Icon(isExpanded ? Icons.expand_less : Icons.expand_more, color: Color(0xff33BADD), size: 24),
        ],
      ),
    );
  }
}
