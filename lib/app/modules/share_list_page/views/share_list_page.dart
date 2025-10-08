import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nsn/app/global_widgets/email_chip_input_field.dart';
import 'package:nsn/app/global_widgets/gray_button_full_sized_widget.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../global_widgets/green_button_full_sized_widget.dart';
import '../widgets/share_list_text_field_widget.dart';

class ShareListPage extends StatelessWidget {
  const ShareListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            children: [
              SizedBox(
                height: 48.h,
                width: 165.w,
                child: GrayButtonFullSizedWidget(
                  buttonText: "Cancle",
                  callbackFunction: () {
                    Get.back();
                  },
                ),
              ),
              Spacer(),
              SizedBox(
                height: 48.h,
                width: 165.w,
                child: GreenButtonFullSizedWidget(
                  buttonText: "Share my list",
                  callbackFunction: () {},
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Text(
                      "List Name",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackText,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    ShareListTextFieldWidget(
                      tec: TextEditingController(),
                      iconPath: AppAssets.appLogo,
                      hintText: "List name",
                      isPasswordTextField: false,
                    ),

                    SizedBox(height: 22.h),

                    EmailChipInputField(
                      label: 'Share With',
                      initialEmails: [],
                      onChanged: (emails) {
                        print('Updated emails: $emails');
                      },
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
      decoration: BoxDecoration(color: AppColors.lightGreenBg),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                AppAssets.backArrowInsideRoundedBoxIcon,
                width: 32.w,
                height: 32.h,
              ),
            ),
            SizedBox(width: 16.w),
            Text(
              "Share my list",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
