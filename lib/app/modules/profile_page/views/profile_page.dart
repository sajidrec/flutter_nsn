import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildCustomAppBar(),
              _headingSection(),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Personal Information",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            AppAssets.edit_button_with_txt_icon,
                            width: 82.w,
                            height: 32.h,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _headingSection() {
    return Padding(
      padding: EdgeInsets.only(top: 11.h, bottom: 24.h),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 96.h,
                width: 96.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // border color
                    width: 4.r, // border width
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(
                  AppAssets.edit_profile_icon,
                  width: 28,
                  height: 28,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "Brooklyn Simmons",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textDarker,
            ),
          ),
          Text(
            "brooklyn.sim@example.com",
            style: TextStyle(fontSize: 16.sp, color: AppColors.fadedTextColor),
          ),
        ],
      ),
    );
  }

  Container _buildCustomAppBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.lightGreenBg),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
