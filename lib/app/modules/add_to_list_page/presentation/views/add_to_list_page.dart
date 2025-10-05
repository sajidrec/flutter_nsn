import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nsn/app/global_widgets/gray_button_full_sized_widget.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';
import 'package:nsn/app/modules/add_to_list_page/presentation/controllers/add_to_list_page_controller.dart';
import 'package:nsn/app/modules/add_to_list_page/presentation/widgets/add_to_list_text_field_widget.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class AddToListPage extends StatelessWidget {
  const AddToListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildCustomAppBar(),
              SizedBox(height: 24.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GetBuilder<AddToListPageController>(
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitledTextField(
                          title: 'Item Name',
                          hintText: 'Enter title',
                          tec: controller.titleTEC,
                        ),
                        SizedBox(height: 16.h),
                        _buildTitledTextField(
                          title: "NIIN/MCN",
                          hintText: 'e.g M1097R1',
                          tec: controller.niinOrMcnTEC,
                        ),
                        SizedBox(height: 16.h),
                        _buildTitledTextField(
                          title: "Model",
                          hintText: 'e.g M1097R1',
                          tec: controller.modelNoTEC,
                        ),
                        SizedBox(height: 16.h),
                        _buildTitledTextField(
                          title: "LIN",
                          hintText: 'e.g. T07679',
                          tec: controller.linTEC,
                        ),
                        SizedBox(height: 16.h),
                        _buildTitledTextField(
                          title: "NSN",
                          hintText: 'e.g. 2320013469317',
                          tec: controller.nsnTEC,
                        ),
                        SizedBox(height: 16.h),
                        _buildTitledTextField(
                          title: "Manual",
                          hintText: 'e.g. TM9-2380',
                          tec: controller.manualNoTEC,
                        ),
                        SizedBox(height: 16.h),
                        _buildAddImageButton(),
                        SizedBox(height: 51.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 165.5.w,
                              child: GrayButtonFullSizedWidget(
                                buttonText: "Cancel",
                                callbackFunction: () {
                                  Get.back();
                                },
                              ),
                            ),
                            SizedBox(width: 12.w),
                            SizedBox(
                              width: 165.5.w,
                              child: GreenButtonFullSizedWidget(
                                buttonText: "Submit Item",
                                callbackFunction: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildAddImageButton() {
    return InkWell(
      onTap: () {},
      child: SvgPicture.asset(
        AppAssets.add_image_image,
        width: 350.w,
        height: 128.h,
      ),
    );
  }

  Column _buildTitledTextField({
    required String title,
    required String hintText,
    required TextEditingController tec,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        AddToListTextFieldWidget(
          tec: tec,
          iconPath: AppAssets.appLogo,
          hintText: hintText,
          isPasswordTextField: false,
        ),
      ],
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
              "Add Item",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
