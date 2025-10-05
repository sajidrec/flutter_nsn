import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants/app_colors.dart';

class GrayButtonFullSizedWidget extends StatelessWidget {
  const GrayButtonFullSizedWidget({
    super.key,
    required this.buttonText,
    this.callbackFunction,
  });

  final String buttonText;
  final VoidCallback? callbackFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: callbackFunction,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.dividerColor,
          foregroundColor: AppColors.semiBlackTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          disabledBackgroundColor: AppColors.disabledBG,
          disabledForegroundColor: AppColors.disabledGreenTextColor,
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
