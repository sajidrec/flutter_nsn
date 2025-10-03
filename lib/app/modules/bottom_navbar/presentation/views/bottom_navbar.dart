import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/core/constants/app_colors.dart';

import '../controllers/bottom_navbar_controller.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<BottomNavbarController>(
        builder: (controller) {
          return Scaffold(
            body: controller.pages[controller.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: GoogleFonts.inter(color: AppColors.blackText),
              unselectedLabelStyle: GoogleFonts.inter(
                color: AppColors.checkboxColor,
              ),
              selectedItemColor: AppColors.greenButtonBG,

              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedHome01,
                    size: 32.sp,
                    color: AppColors.semiGreenPinPutBG,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.myListIcon,
                    width: 32.w,
                    height: 32.h,
                  ),
                  label: "My List",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.bountiesIcon,
                    width: 32.w,
                    height: 32.h,
                  ),
                  label: "Bounties",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.myProfileIcon,
                    width: 32.w,
                    height: 32.h,
                  ),
                  label: "Profile",
                ),
              ],
              onTap: controller.changePage,
              currentIndex: controller.currentIndex,
            ),
          );
        },
      ),
    );
  }
}
