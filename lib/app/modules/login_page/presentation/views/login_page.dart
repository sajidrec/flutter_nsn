import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/core/constants/app_colors.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';
import 'package:nsn/app/modules/login_page/presentation/controllers/login_page_controller.dart';
import 'package:nsn/app/routes/app_routes.dart';

import '../../../../global_widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passTEC = TextEditingController();

  @override
  void dispose() {
    _emailTEC.dispose();
    _passTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 29.h),
            Center(
              child: Image.asset(
                AppAssets.appLogo,
                width: 143.w,
                height: 144.h,
              ),
            ),
            SizedBox(height: 47.h),
            Text(
              "Sign In Your Account",
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff505050),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      tec: _emailTEC,
                      hintText: "User name or email",
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
                            child: GetBuilder<LoginPageController>(
                              builder: (controller) {
                                return Checkbox(
                                  value: controller.rememberMe,
                                  onChanged: (value) {
                                    controller.toggleRememberMe();
                                  },
                                  side: BorderSide(
                                    color: AppColors.checkboxColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  checkColor: AppColors.bgWhite,
                                  fillColor: controller.rememberMe
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
                          "Remainder me",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.checkboxColor,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Forget password?",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColors.blackText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    GreenButtonFullSizedWidget(
                      buttonText: "Sing In",
                      callbackFunction: () {},
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
                          "Don’t haven an account?",
                          style: GoogleFonts.inter(
                            color: AppColors.checkboxColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.signUpRoute);
                          },
                          child: Text(
                            " Sign Up",
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
    );
  }
}
