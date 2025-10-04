import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class SearchResultElementWidget extends StatelessWidget {
  const SearchResultElementWidget({
    super.key,
    required this.title,
    required this.niinMcn,
    required this.modelNo,
    required this.nsn,
    required this.lin,
    required this.eic,
    required this.manualNo,
  });

  final String title;
  final String niinMcn;
  final String modelNo;
  final String nsn;
  final String lin;
  final String eic;
  final String manualNo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.greenButtonBG,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              AppAssets.imageIcon,
              height: 28.67.h,
              width: 28.67.w,
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(AppAssets.optionIcon, height: 24.h, width: 24.w),
          ],
        ),
        SizedBox(height: 20.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "niin/mcn:".toUpperCase(),
                        style: GoogleFonts.inter(
                          color: AppColors.semiBlackTextColor,
                        ),
                      ),
                      Text(
                        niinMcn,
                        style: GoogleFonts.inter(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 60.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Model:".toUpperCase(),
                        style: GoogleFonts.inter(
                          color: AppColors.semiBlackTextColor,
                        ),
                      ),
                      Text(
                        modelNo,
                        style: GoogleFonts.inter(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NSN:".toUpperCase(),
                        style: GoogleFonts.inter(
                          color: AppColors.semiBlackTextColor,
                        ),
                      ),
                      Text(
                        nsn,
                        style: GoogleFonts.inter(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 60.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LIN:".toUpperCase(),
                        style: GoogleFonts.inter(
                          color: AppColors.semiBlackTextColor,
                        ),
                      ),
                      Text(
                        lin,
                        style: GoogleFonts.inter(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EIC:".toUpperCase(),
                        style: GoogleFonts.inter(
                          color: AppColors.semiBlackTextColor,
                        ),
                      ),
                      Text(
                        eic,
                        style: GoogleFonts.inter(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 60.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Manual:".toUpperCase(),
                        style: GoogleFonts.inter(
                          color: AppColors.semiBlackTextColor,
                        ),
                      ),
                      Text(
                        manualNo,
                        style: GoogleFonts.inter(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
