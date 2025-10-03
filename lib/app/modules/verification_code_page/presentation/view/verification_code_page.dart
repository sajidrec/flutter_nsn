import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsn/app/routes/app_routes.dart';
import 'package:pinput/pinput.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/core/constants/app_colors.dart';
import 'package:get/get.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  String currentPin = ""; // track current input
  final int pinLength = 6;

  @override
  Widget build(BuildContext context) {
    bool isAllCompleted = currentPin.length == pinLength;

    final defaultPinTheme = PinTheme(
      width: 44.w,
      height: 44.h,
      textStyle: GoogleFonts.inter(
        color: AppColors.greenButtonBG,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(7.63.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(7.63.r),
        border: Border.all(color: AppColors.pinputBorderGreen, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.semiGreenPinPutBG,
        borderRadius: BorderRadius.circular(7.63.r),
      ),
      textStyle: GoogleFonts.inter(
        color: AppColors.greenButtonBG,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    );

    final completedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.greenButtonBG,
        borderRadius: BorderRadius.circular(7.63.r),
        border: Border.all(color: AppColors.greenButtonBG, width: 2),
      ),
      textStyle: GoogleFonts.inter(
        color: AppColors.bgWhite,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                SizedBox(height: 131.h),
                SvgPicture.asset(
                  AppAssets.verificationPageMessage,
                  width: 351.w,
                  height: 63.h,
                ),
                SizedBox(height: 24.h),
                Pinput(
                  length: pinLength,
                  closeKeyboardWhenCompleted: true,
                  defaultPinTheme: isAllCompleted
                      ? completedPinTheme
                      : defaultPinTheme,
                  focusedPinTheme: isAllCompleted
                      ? completedPinTheme
                      : focusedPinTheme,
                  submittedPinTheme: isAllCompleted
                      ? completedPinTheme
                      : submittedPinTheme,
                  onChanged: (pin) {
                    setState(() {
                      currentPin = pin; // update current PIN
                    });
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t received the code? ",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend",
                        style: GoogleFonts.inter(
                          color: AppColors.greenButtonBG,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.greenButtonBG,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 365.h),

                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: isAllCompleted
                        ? () {
                            Get.offAllNamed(AppRoutes.resetPassRoute);
                          }
                        : null, // null disables the button
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: AppColors.disabledBG,
                      backgroundColor: AppColors.greenButtonBG,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.63.r),
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isAllCompleted
                            ? AppColors.disabledBG
                            : AppColors.disabledGreenTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
