import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/global_widgets/gray_button_full_sized_widget.dart';
import 'package:nsn/app/modules/create_new_list_page/presentation/controller/create_new_list_page_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../global_widgets/green_button_full_sized_widget.dart';
import '../widgets/craete_new_list_text_field_widget.dart';

class CreateNewListPage extends StatelessWidget {
  const CreateNewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
          child: GetBuilder<CreateNewListPageController>(
            builder: (controller) {
              return Row(
                children: [
                  SizedBox(width: 12.w),
                  SizedBox(
                    width: 169.5.w,
                    child: GrayButtonFullSizedWidget(
                      buttonText: "Cancle",
                      callbackFunction: () {},
                    ),
                  ),
                  SizedBox(width: 12.w),
                  SizedBox(
                    width: 169.5.w,
                    child: GreenButtonFullSizedWidget(
                      buttonText: "Create New List",
                      callbackFunction: controller.disableCreateNewListButton
                          ? null
                          : () {},
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildCustomAppBar(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "List Name",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.blackText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GetBuilder<CreateNewListPageController>(
                      builder: (controller) {
                        return CreateNewListTextFieldWidget(
                          tec: controller.listNameTEC,
                          iconPath: AppAssets.appLogo,
                          hintText: "Write your list name",
                          isPasswordTextField: false,
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
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                AppAssets.back_arrow_rounded_icon,
                width: 32.w,
                height: 32.h,
              ),
            ),
            SizedBox(width: 16.w),
            Text(
              "Create A New List",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
