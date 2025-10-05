import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class AddToListTextFieldWidget extends StatefulWidget {
  const AddToListTextFieldWidget({
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
  State<AddToListTextFieldWidget> createState() =>
      _AddToListTextFieldWidgetState();
}

class _AddToListTextFieldWidgetState extends State<AddToListTextFieldWidget> {
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.tec,
      obscureText: hidePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),

        suffixIcon: widget.isPasswordTextField
            ? IconButton(
                onPressed: () {
                  hidePassword = !hidePassword;
                  setState(() {});
                },
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
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
