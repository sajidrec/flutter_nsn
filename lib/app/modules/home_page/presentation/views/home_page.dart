import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/core/constants/app_colors.dart';
import 'package:nsn/app/global_widgets/text_field_widget.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 157.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGreenBg,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    TextFieldWidget(
                      tec: _searchController,
                      iconPath: AppAssets.searchIcon,
                      hintText: "Search by Item name, NSN, or Model...",
                      isPasswordTextField: false,
                    ),
                    SizedBox(height: 16.h),

                    _buildSearchButton(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.homeSearchResultRoute,
                          arguments: {'searchKeyword': _searchController.text},
                        );
                      },
                    ),

                    SizedBox(height: 41.h),

                    Container(
                      width: 351.w,
                      height: 224.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15.75.h),
                          SvgPicture.asset(
                            AppAssets.rewardIcon,
                            width: 86.26.w,
                            height: 112.64.h,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "20 Bounties",
                            style: GoogleFonts.inter(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.greenButtonBG,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: Text(
                              textAlign: TextAlign.center,
                              "You’ve earned 20 bounties. Keep contributing to unlock more rewards.",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.checkboxColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    _buildAddItems(onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildAddItems({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        AppAssets.addButtonImg,
        width: double.infinity,
        height: 48.h,
      ),
    );
  }

  InkWell _buildSearchButton({required VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 48.h,
        child: SvgPicture.asset(AppAssets.searchButton),
      ),
    );
  }
}
