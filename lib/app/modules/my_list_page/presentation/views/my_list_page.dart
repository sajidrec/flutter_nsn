import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../global_widgets/gray_button_full_sized_widget.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildCustomAppBar(),
            Column(
              children: [
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 170.w,
                        height: 48.h,
                        child: GreenButtonFullSizedWidget(
                          buttonText: "Created by me",
                          callbackFunction: () {},
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 170.w,
                        height: 48.h,
                        child: GrayButtonFullSizedWidget(
                          buttonText: "Shared with me",
                          callbackFunction: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 33.h),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  width: 375.w,
                  height: 268.h,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My List",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        SizedBox(
                          height: 160.h,
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.imageIcon,
                                  width: 35.w,
                                  height: 35.h,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  "My List 01",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.semiBlackTextColor,
                                  ),
                                ),
                                Spacer(),

                                PopupMenuButton(
                                  // offset: Offset(-15.w, 70.h),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  icon: SvgPicture.asset(
                                    AppAssets.optionIcon,
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                  onSelected: (value) {
                                    log("menu selected item: $value");

                                    // if (value == 'select multiple') {
                                    //   controller.toggleSelectMultipleMode();
                                    // } else if (value == 'add my list') {
                                    //   Get.toNamed(AppRoutes.addToListRoute);
                                    // }
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: 'share',
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            AppAssets.share_icon,
                                            width: 32.w,
                                            height: 32.h,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            "Share",
                                            style: GoogleFonts.inter(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 'delete',
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            AppAssets.delete_icon,
                                            width: 32.w,
                                            height: 32.h,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            "Delete",
                                            style: GoogleFonts.inter(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 'edit',
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            AppAssets.edit_icon,
                                            width: 32.w,
                                            height: 32.h,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            "Edit",
                                            style: GoogleFonts.inter(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 20.h),
                            itemCount: 30,
                          ),
                        ),

                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.greenButtonBG,
                            side: BorderSide(
                              color: AppColors.semiGreenPinPutBG,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Create New",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              SvgPicture.asset(
                                AppAssets.plus_around_icon,
                                width: 20.sp,
                                height: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
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
              "My List",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
