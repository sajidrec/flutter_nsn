import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsn/app/core/constants/app_assets.dart';
import 'package:nsn/app/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _moveToNextPage();
  }

  Future<void> _moveToNextPage() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff144D2A), Color(0xff013315)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.appLogo, width: 143.w, height: 144.h),
              SizedBox(height: 32.h),
              Image.asset(
                AppAssets.splashScreenTxt,
                width: 351.w,
                height: 77.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
