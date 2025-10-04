import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class HomeSearchTextFieldWidget extends StatefulWidget {
  const HomeSearchTextFieldWidget({
    super.key,
    required this.tec,
    required this.iconPath,
    required this.hintText,
    required this.isPasswordTextField,
  });

  final TextEditingController tec;
  final String iconPath;
  final String hintText;
  final bool isPasswordTextField;

  @override
  State<HomeSearchTextFieldWidget> createState() =>
      _HomeSearchTextFieldWidgetState();
}

class _HomeSearchTextFieldWidgetState extends State<HomeSearchTextFieldWidget> {
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.tec,
      obscureText: hidePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        suffixIcon: SvgPicture.asset(
          widget.iconPath,
          width: 24.w,
          height: 24.h,
          fit: BoxFit.scaleDown,
        ),
        hintText: widget.hintText,
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
