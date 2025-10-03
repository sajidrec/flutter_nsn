import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/core/constants/app_colors.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';

import '../../../../routes/app_routes.dart';
import '../controllers/forget_password_page_controller.dart';
import '../widgets/forget_pass_text_field_widget.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _forgetPassTec = TextEditingController();

  @override
  void dispose() {
    _forgetPassTec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 131.h),
              Center(
                child: Text(
                  "Forget Password",
                  style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.semiBlackTextColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.w),
                child: Text(
                  "Reset your account password and access your personal account again",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyTextColor,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: ForgetPassTextFieldWidget(
                  tec: _forgetPassTec,
                  iconPath: AppAssets.emailIcon,
                  hintText: "Enter your email",
                  isPasswordTextField: false,
                ),
              ),
              SizedBox(height: 375.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: GetBuilder<ForgetPasswordPageController>(
                  builder: (controller) {
                    return GreenButtonFullSizedWidget(
                      buttonText: "Next",
                      callbackFunction: controller.disableButton
                          ? null
                          : () {
                              Get.toNamed(AppRoutes.verificationCodeRoute);
                            },
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
}
