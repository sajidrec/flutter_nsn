import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsn/app/global_widgets/text_field_widget.dart';

import '../../../../core/constants/app_assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // TODO: Implement bg color behind the search

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                TextFieldWidget(
                  tec: _searchController,
                  iconPath: AppAssets.searchIcon,
                  hintText: "Search by Item name, NSN, or Model...",
                  isPasswordTextField: false,
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: SvgPicture.asset(AppAssets.searchButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
