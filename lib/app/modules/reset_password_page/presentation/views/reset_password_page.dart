import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';

import '../../../../routes/app_routes.dart';
import '../controllers/reset_password_page_controller.dart';
import '../widgets/reset_page_text_form_field_widget.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _newPassTec = TextEditingController();
  final TextEditingController _confirmPassTec = TextEditingController();

  @override
  void dispose() {
    _newPassTec.dispose();
    _confirmPassTec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                SizedBox(height: 132.h),
                SvgPicture.asset(
                  AppAssets.resetPageTxt,
                  width: 351.w,
                  height: 63.h,
                ),

                SizedBox(height: 24.h),
                ResetPageTextFormFieldWidget(
                  hintText: "New password",
                  iconPath: AppAssets.lockIcon,
                  tec: _newPassTec,
                  isPasswordTextField: false,
                ),

                SizedBox(height: 16.h),

                ResetPageTextFormFieldWidget(
                  hintText: "Confirm password",
                  iconPath: AppAssets.lockIcon,
                  tec: _confirmPassTec,
                  isPasswordTextField: false,
                ),

                SizedBox(height: 329.h),

                GetBuilder<ResetPasswordPageController>(
                  builder: (controller) {
                    return GreenButtonFullSizedWidget(
                      buttonText: "Next",
                      callbackFunction: controller.totalEmptyFields == 0
                          ? () {
                              if (_confirmPassTec.text != _newPassTec.text ||
                                  _newPassTec.text.isEmpty) {
                                Get.snackbar("Error", "Passwords don't match");
                              } else {
                                Get.offAllNamed(AppRoutes.loginRoute);
                              }
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
