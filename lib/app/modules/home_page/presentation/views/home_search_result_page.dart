import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/modules/home_page/presentation/controllers/home_search_result_page_controller.dart';
import 'package:nsn/app/modules/home_page/presentation/widgets/home_search_text_field_widget.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/search_result_element_widget.dart';

class HomeSearchResultPage extends StatelessWidget {
  const HomeSearchResultPage({super.key, required this.searchKeyword});

  final String searchKeyword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
