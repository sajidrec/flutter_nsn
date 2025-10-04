import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';
import 'package:nsn/app/modules/home_page/presentation/controllers/home_search_result_page_controller.dart';
import 'package:nsn/app/modules/home_page/presentation/widgets/home_search_text_field_widget.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/search_result_element_widget.dart';

class HomeSearchResultPage extends StatelessWidget {
  HomeSearchResultPage({super.key, required this.searchKeyword});

  final String searchKeyword;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: SizedBox(
          width: 325.w,
          child: Drawer(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.short_and_filter_text,
                        width: 132.w,
                        height: 32.h,
                      ),
                      SizedBox(height: 20.h),
                      Divider(color: AppColors.dividerColor),
                      SizedBox(height: 16.h),
                      Text(
                        "Short by:",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Wrap(
                        children: [
                          _buildShortByTagElement(tagName: 'Model'),
                          SizedBox(width: 8),
                          _buildShortByTagElement(tagName: 'niin/mcn'),
                          SizedBox(width: 8),
                          _buildShortByTagElement(tagName: 'LIN'),
                          SizedBox(width: 8),
                          _buildShortByTagElement(tagName: 'NSN'),
                          SizedBox(width: 8),
                          _buildShortByTagElement(tagName: 'Manual'),
                          SizedBox(width: 8),
                          _buildShortByTagElement(tagName: 'EIC'),
                        ],
                      ),

                      SizedBox(height: 24.h),

                      Text(
                        "Filter by:",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      GetBuilder<HomeSearchResultPageController>(
                        builder: (controller) {
                          return Column(
                            children: [
                              _buildFilterByTextField(
                                title: "niin/mcn",
                                hintText: "Filter by NIIN/MCN",
                                tec: controller.niinMcnTec,
                              ),

                              SizedBox(height: 8.h),

                              _buildFilterByTextField(
                                title: "Model",
                                hintText: "Filter by Model",
                                tec: controller.modelNoTec,
                              ),

                              SizedBox(height: 8.h),

                              _buildFilterByTextField(
                                title: "NSN",
                                hintText: "Filter by NSN",
                                tec: controller.nsnTec,
                              ),

                              SizedBox(height: 8.h),

                              _buildFilterByTextField(
                                title: "LIN",
                                hintText: "Filter by LIN",
                                tec: controller.linTec,
                              ),

                              SizedBox(height: 8.h),

                              _buildFilterByTextField(
                                title: "EIC",
                                hintText: "Filter by EIC",
                                tec: controller.eicTec,
                              ),

                              SizedBox(height: 8.h),

                              _buildFilterByTextField(
                                title: "Manual",
                                hintText: "Filter by Manual",
                                tec: controller.manualTec,
                              ),

                              SizedBox(height: 8.h),
                              GreenButtonFullSizedWidget(
                                buttonText: "Filter",
                                callbackFunction: () {},
                              ),
                              SizedBox(height: 8.h),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 88.h,
              decoration: BoxDecoration(
                color: AppColors.lightGreenBg,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24.r),
                  bottomLeft: Radius.circular(24.r),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  GetBuilder<HomeSearchResultPageController>(
                    builder: (controller) {
                      return HomeSearchTextFieldWidget(
                        tec: controller.searchTec,
                        iconPath: AppAssets.filterIcon,
                        hintText: "Search by NSN, NIIN, LIN, EIC etc",
                        isPasswordTextField: false,
                        scaffoldKey: scaffoldKey,
                      );
                    },
                  ),
                  SizedBox(height: 26.h),
                  _buildSearchButton(onTap: () {}),
                  SizedBox(height: 21.h),
                  Expanded(
                    child: SizedBox(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        // primary: false,
                        itemBuilder: (context, index) => Container(
                          width: 351.w,
                          height: 248.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: SearchResultElementWidget(
                              title: 'TRK UTIL 10000',
                              niinMcn: '013469317',
                              modelNo: '013469317',
                              nsn: '013469317',
                              lin: '013469317',
                              eic: '013469317',
                              manualNo: '013469317',
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemCount: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildFilterByTextField({
    required String title,
    required String hintText,
    required TextEditingController tec,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(color: AppColors.semiBlackTextColor),
          ),
          TextField(
            controller: tec,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: AppColors.checkboxColor),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: AppColors.bgWhite,
            ),
          ),
        ],
      ),
    );
  }

  Chip _buildShortByTagElement({required String tagName}) {
    return Chip(
      backgroundColor: Colors.white,
      label: Row(
        mainAxisSize: MainAxisSize.min, // important!
        children: [
          SvgPicture.asset(
            AppAssets.up_down_arrow_icon,
            height: 20.h,
            width: 20.w,
          ),
          SizedBox(width: 4.w),
          Text(tagName, style: TextStyle(color: AppColors.hintTextColor)),
        ],
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
