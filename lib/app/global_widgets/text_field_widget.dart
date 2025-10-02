import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.tec,
    required this.iconPath,
    required this.hintText,
  });

  final TextEditingController tec;
  final String iconPath;
  final String hintText;

  // TODO: add hide / show password

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tec,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
        prefixIcon: SvgPicture.asset(
          iconPath,
          width: 24.w,
          height: 24.h,
          fit: BoxFit.scaleDown,
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.hintTextColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.r),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
