import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_item_model.dart';
import 'package:shimmer/shimmer.dart';

class ActivityDetailsBody extends StatelessWidget {
  const ActivityDetailsBody({
    super.key,
    this.activityItem,
  });

  final ActivityItemModel? activityItem;
  
  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Color(0xff2A3A40),
      highlightColor: Color(0xff3A4A50),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xff1A2A30),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 24,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Container(
              width: 200,
              height: 16,
              color: Colors.white,
            ),
            SizedBox(height: 15),
            Divider(color: Colors.white),
            SizedBox(height: 15),
            Container(
              width: 150,
              height: 20,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Container(
              width: 120,
              height: 16,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Container(
              width: 180,
              height: 16,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (activityItem == null) {
      return _buildShimmerLoading();
    }

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff1A2A30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activityItem?.taskHeading ?? '',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            activityItem?.taskSubHeading ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15,),
          Divider(color: Colors.white,),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text(
                activityItem?.details?.fullName ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff33BADD),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [                      
                  Text(
                    activityItem?.details?.mobileNo ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                //  SizedBox(width: 140,),
                  // GestureDetector(
                  //   onTap: () => _makePhoneCall(clientPhoneNo.replaceAll('+91 ', '')),
                  //   child: Image.asset('assets/icons/phone.png', width: 40, height: 40,),
                  // ),
                ],
              ),
               SizedBox(height: 5,),
              Text(
                activityItem?.details?.emailId ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          if(activityItem?.isBirthdayTask ?? false) ...[
            Text(
            'They turn ${activityItem?.details?.clientAge} years today!',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          ]
        ],
      ),
    );
  }
}