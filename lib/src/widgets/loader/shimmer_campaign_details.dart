import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_theme_data.dart';
import 'package:lazba/src/utils/responsive.dart';

class ShimmerCampaignDetails extends StatelessWidget {
  const ShimmerCampaignDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: SizedBox(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile(context) ? 2 : 3,
                crossAxisSpacing: isMobile(context) ? 15 : 20,
                mainAxisSpacing: isMobile(context) ? 15 : 20,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (_, __) => Shimmer.fromColors(
                highlightColor: Colors.grey[300]!,
                baseColor: Colors.grey[200]!,
                child: Container(
                  // height: 130,
                  // width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppThemeData.boxShadowColor.withOpacity(0.05),
                        spreadRadius: 0,
                        blurRadius: 30,
                        offset:
                            const Offset(0, 15), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
