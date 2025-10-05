import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/global_widgets/gray_button_full_sized_widget.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';
import 'package:nsn/app/modules/home_page/presentation/controllers/home_search_result_page_controller.dart';
import 'package:nsn/app/modules/home_page/presentation/widgets/home_search_text_field_widget.dart';
import 'package:nsn/app/routes/app_routes.dart';

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
        bottomNavigationBar: _buildBottomNavBar(context),
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
                              elementId: index,
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemCount: 10,
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

  Padding _buildBottomNavBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: GetBuilder<HomeSearchResultPageController>(
        builder: (controller) {
          return !controller.selectMultipleMode
              ? SizedBox.shrink()
              : Row(
                  children: [
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 162.w,
                      child: GrayButtonFullSizedWidget(
                        buttonText: "Cancel",
                        callbackFunction: () {
                          controller.toggleSelectMultipleMode();
                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 162.w,
                      child: _buildAddToListButton(controller, context),
                    ),
                  ],
                );
        },
      ),
    );
  }

  GreenButtonFullSizedWidget _buildAddToListButton(
    HomeSearchResultPageController controller,
    BuildContext context,
  ) {
    return GreenButtonFullSizedWidget(
      buttonText: "Add List",
      callbackFunction: controller.totalSelectedSearchElements == 0
          ? null
          : () async {
              await showModalBottomSheet(
                context: context,
                builder: (context) {
                  return GetBuilder<HomeSearchResultPageController>(
                    builder: (controller) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                          ),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.craeteNewListRoute);
                                },
                                child: Text(
                                  "Create New",
                                  style: TextStyle(
                                    color: AppColors.greenButtonBG,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              Column(
                                children: [
                                  SizedBox(
                                    height: Get.height / 3,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.semiGray,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            height: 35.h,
                                            width: 35.w,
                                          ),
                                          SizedBox(width: 12.w),
                                          Text(
                                            "My List $index",
                                            style: TextStyle(
                                              color: AppColors.blackText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          Spacer(),
                                          Checkbox(
                                            value:
                                                controller
                                                    .myListCheckedList[index] ??
                                                false,
                                            side: BorderSide(
                                              color: AppColors.checkboxColor,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                            ),
                                            checkColor: AppColors.bgWhite,
                                            fillColor:
                                                (controller
                                                        .myListCheckedList[index] ??
                                                    false)
                                                ? WidgetStatePropertyAll(
                                                    AppColors.greenButtonBG,
                                                  )
                                                : null,
                                            onChanged: (value) {
                                              controller.toogleMyListChecked(
                                                index,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 24.h),
                                      itemCount: 30,
                                    ),
                                  ),

                                  SizedBox(height: 12.h),

                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 165.w,
                                        height: 48.h,
                                        child: GrayButtonFullSizedWidget(
                                          buttonText: "Cancle",
                                          callbackFunction: () {
                                            if (context.mounted) {
                                              Get.back();
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      SizedBox(
                                        width: 165.w,
                                        height: 48.h,
                                        child: GreenButtonFullSizedWidget(
                                          buttonText: "Add List",
                                          callbackFunction:
                                              controller
                                                      .totalSelectedListElements ==
                                                  0
                                              ? null
                                              : () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
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
