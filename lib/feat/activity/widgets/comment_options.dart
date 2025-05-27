import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

enum CommentTypes {
  closingToday('Closing Today'),
  mightBeDelayed('Might be delayed'),
  needCall('Need A Call'),
  addYourOwn('Add Your Own');

  const CommentTypes(this.value);
  final String value;
}

class CommentOptions extends StatelessWidget {
  const CommentOptions({
    super.key,
    required this.commentType,
    required this.onSelected,
  });

  final CommentTypes commentType;
  final Function(CommentTypes) onSelected;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(commentType),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: NbaTheme.grayFour,
        ),
        child: Row(
          children: [
            Text(
              commentType.value,
              style: TextStyle(
                color: NbaTheme.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(10),
            SvgPicture.asset(
              'assets/icons/comment_option.svg',
              width: 20,
              height: 20,
              package: 'nba_sdk',
            )
          ],
        ),
      ),
    );
  }
}