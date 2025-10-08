import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/core/constants/app_colors.dart';

class EarnBountyTipPage extends StatelessWidget {
  const EarnBountyTipPage({super.key});

  final String txt = '''
If you find an item that is NOT in the
database:
1. Take approximately 3 pictures of the item
from different angles.
2. Telescoping pictures of data plate or
packaging showing the NSN.
3. Our team will review what you submitted,
and if approved, you will be awarded
bounties!
4. Your contributions will make everyone's
job easier.
5. Submitting missing information (i.e.
missing LIN for an NSN), upon approval, will
also award you Bounties.
Note: Our team will edit any pictures as
necessary to erase any specific unit
markings, serial number etc. Please do not
submit any technical data (blueprints,
schematics, etc.) Happy hunting!
''';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12.sp, left: 12.sp, right: 12.sp),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Center(
                            child: SvgPicture.asset(
                              AppAssets.rewardIcon,
                              width: 80.w,
                              height: 80.h,
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 200.w,
                            child: Text(
                              "The more you contribute, the more you earn!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.greenButtonBG,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          txt,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.blackText,
                          ),
                        ),
                      ],
                    ),
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
