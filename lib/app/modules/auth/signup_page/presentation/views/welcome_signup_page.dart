import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/global_widgets/green_button_full_sized_widget.dart';

class WelcomeSignupPage extends StatelessWidget {
  const WelcomeSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 92.h),
            Center(
              child: Image.asset(
                AppAssets.appLogo,
                width: 143.w,
                height: 144.h,
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(height: 12.h),
            SvgPicture.asset(
              AppAssets.welcomeNSNFinder,
              height: 210.h,
              width: 351.w,
            ),
            SizedBox(height: 210.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: GreenButtonFullSizedWidget(
                buttonText: "Continue",
                callbackFunction: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
