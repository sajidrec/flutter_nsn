import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsn/app/core/constants/app_assets.dart';

import '../../../../core/constants/app_colors.dart';

class BountiesPage extends StatelessWidget {
  const BountiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildCustomAppBar(),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 220.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15.75),
                          SvgPicture.asset(
                            AppAssets.rewardIcon,
                            width: 86.26.w,
                            height: 112.64.h,
                          ),
                          SizedBox(height: 15.65.h),
                          Text(
                            "20 Bounties",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.greenButtonBG,
                            ),
                          ),
                          SizedBox(height: 12.h),

                          // TODO: work from here
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("How to Earn "),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Bounties?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCustomAppBar() {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(color: AppColors.lightGreenBg),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            Text(
              "Bounties",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Text(
                "Earn Bounties",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.greenButtonBG,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
