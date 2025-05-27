import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_status_btn.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    this.status = NotificationStatus.unread
  });

  final String title;
  final String description;
  final String time;
  final NotificationStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: status.isUnread ? Color(0xff1A2A30) : null,
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Gap(5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(status.isUnread) ...[
                SvgPicture.asset('assets/icons/new_notification.svg', package: 'nba_sdk', width: 10, height: 10,),
                SizedBox(width: 10,)
              ] else ...[
                SizedBox(width: 20,),
              ],
              Expanded(
                flex: 4,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  DateFormat('yyyy-MM-dd').format(DateTime.parse(time)),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              Expanded(
                flex: 6,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                  softWrap: true,
                ),
                
              ),
                Expanded(
                  flex: 1,
                child: SvgPicture.asset('assets/icons/chevron_right.svg', package: 'nba_sdk', width: 10, height: 10,)
                
              )
            ],
          )
        ],
      ),
    );
  }
}