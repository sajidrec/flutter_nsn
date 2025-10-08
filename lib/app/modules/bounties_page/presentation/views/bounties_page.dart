import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:get/get.dart';
import 'package:nsn/app/routes/app_routes.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../global_widgets/green_button_full_sized_widget.dart';

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 212.h,
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
                    SizedBox(height: 31.h),
                    Text(
                      "Spend Your Bounties",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.sp),
                          child: Row(
                            children: [
                              Chip(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                backgroundColor: Colors.white,
                                label: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "15",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.greenButtonBG,
                                      ),
                                    ),
                                    Text(
                                      "Bounties",
                                      style: TextStyle(
                                        color: AppColors.checkboxColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Remove ads for",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackText,
                                    ),
                                  ),
                                  Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    label: Text(
                                      "1 month",
                                      style: TextStyle(
                                        color: AppColors.semiBlackTextColor,
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                ],
                              ),
                              Spacer(),
                              _buildSpendNowButton(),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemCount: 30,
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

  InkWell _buildSpendNowButton() {
    return InkWell(
      onTap: () {
        Get.dialog(
          Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                width: 351.w,
                height: 287.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    Center(
                      child: SvgPicture.asset(
                        AppAssets.celebrateIcon,
                        width: 80.w,
                        height: 80.h,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        "Congratulations",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          "You can now use this app free for 1 month without any Ads.",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.checkboxColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: GreenButtonFullSizedWidget(
                        buttonText: "OK",
                        callbackFunction: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: SvgPicture.asset(
        AppAssets.spend_now_button,
        width: 66.w,
        height: 54.h,
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
              onTap: () {
                Get.toNamed(AppRoutes.earnBountyTipRoute);
              },
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
