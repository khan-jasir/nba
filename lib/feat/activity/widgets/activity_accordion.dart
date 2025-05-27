import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/widgets/actitvity_header.dart';
import 'package:nba_sdk/feat/activity/widgets/actitvity_tile.dart';

class ActivityAccordion extends StatefulWidget {
  final List<ActivityTile> activities;
  final ActivityBuckets bucket;
  
  const ActivityAccordion({
    super.key,
    required this.activities,
    required this.bucket,
  });

  @override
  State<ActivityAccordion> createState() => _ActivityAccordionState();
}

class _ActivityAccordionState extends State<ActivityAccordion> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: ActivityHeader(isExpanded: _isExpanded, bucket: widget.bucket),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: _isExpanded
              ? Column(
                  children: [
                    ...widget.activities.map((activity) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: activity,
                        )),
                  ],
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}