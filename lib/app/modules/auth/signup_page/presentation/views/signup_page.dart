import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/core/constants/app_colors.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';
import 'package:get/get.dart';
import 'package:nsn/app/routes/app_routes.dart';

import '../../../../../global_widgets/text_field_widget.dart';
import '../controller/signup_page_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passTEC = TextEditingController();

  @override
  void dispose() {
    _nameTEC.dispose();
    _emailTEC.dispose();
    _passTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 54.h),

              Center(
                child: Text(
                  "Create An Account",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: AppColors.semiBlackTextColor,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      TextFieldWidget(
                        tec: _nameTEC,
                        hintText: "name",
                        iconPath: AppAssets.personIcon,
                        isPasswordTextField: false,
                      ),
                      SizedBox(height: 16.h),
                      TextFieldWidget(
                        tec: _emailTEC,
                        hintText: "email or phone number",
                        iconPath: AppAssets.emailIcon,
                        isPasswordTextField: false,
                      ),
                      SizedBox(height: 16.h),
                      TextFieldWidget(
                        tec: _passTEC,
                        hintText: "Password",
                        iconPath: AppAssets.lockIcon,
                        isPasswordTextField: true,
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 16.w,
                            height: 16.h,
                            child: Transform.scale(
                              scale: 16.67.w / 24,
                              child: GetBuilder<SignupPageController>(
                                builder: (controller) {
                                  return Checkbox(
                                    value: controller.userAgreed,
                                    onChanged: (value) {
                                      controller.toggleUserAgree();
                                    },
                                    side: BorderSide(
                                      color: AppColors.checkboxColor,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    checkColor: AppColors.bgWhite,
                                    fillColor: controller.userAgreed
                                        ? WidgetStatePropertyAll(
                                            AppColors.greenButtonBG,
                                          )
                                        : null,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "I agree to the ",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: AppColors.checkboxColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Terms & Condition",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                color: AppColors.semiBlackTextColor,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.semiBlackTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),

                      GreenButtonFullSizedWidget(
                        buttonText: "Create Account",
                        callbackFunction: () {
                          Get.offAllNamed(AppRoutes.signUpWelcomeRoute);
                        },
                      ),

                      SizedBox(height: 24.h),

                      Text(
                        "Or sing in with",
                        style: GoogleFonts.inter(
                          color: AppColors.greyTextColor,
                          fontSize: 14.sp,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      SizedBox(
                        height: 56.w,
                        width: 56.h,
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AppAssets.googleButton),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already a member?",
                            style: GoogleFonts.inter(
                              color: AppColors.checkboxColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              " Sign In",
                              style: GoogleFonts.inter(
                                color: AppColors.greenButtonBG,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
