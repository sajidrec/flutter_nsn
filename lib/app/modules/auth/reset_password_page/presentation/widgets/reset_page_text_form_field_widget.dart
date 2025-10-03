import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';
import '../controllers/reset_password_page_controller.dart';

class ResetPageTextFormFieldWidget extends StatefulWidget {
  const ResetPageTextFormFieldWidget({
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
  State<ResetPageTextFormFieldWidget> createState() =>
      _ResetPageTextFormFieldWidgetState();
}

class _ResetPageTextFormFieldWidgetState
    extends State<ResetPageTextFormFieldWidget> {
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordPageController>(
      builder: (controller) {
        if (!controller.fieldEmptyMap.containsKey(widget.tec)) {
          controller.registerField(widget.tec);
        }
        return TextFormField(
          controller: widget.tec,
          obscureText: hidePassword,
          onChanged: (value) {
            if (value.isEmpty) {
              controller.setFieldEmpty(widget.tec, true);
            } else {
              controller.setFieldEmpty(widget.tec, false);
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 18.h,
            ),
            prefixIcon: SvgPicture.asset(
              widget.iconPath,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.scaleDown,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 40.w,
              minHeight: 40.h,
            ),
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
      },
    );
  }
}
