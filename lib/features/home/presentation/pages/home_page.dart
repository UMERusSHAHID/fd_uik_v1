import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_kit/core/constants/app_colors.dart';
import 'package:food_delivery_kit/core/constants/app_image_strings.dart';
import 'package:food_delivery_kit/core/widgets/food_card.dart';

import '../../../../core/widgets/category_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, top: 74).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppImageStrings.menu),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0).r,
                    child: SvgPicture.asset(AppImageStrings.shoppingCart),
                  ),
                ],
              ),
              SizedBox(height: 46.h),
              Row(
                children: [
                  Text(
                    "Delicious\nfood for you",
                    style: TextStyle(
                      color: AppColors.blackText,
                      fontSize: 34.sp,
                      fontFamily: 'SfProRounded',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 60.h,
                  width: 314.w,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldBackground,
                      prefixIcon: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 35,
                            top: 18,
                            bottom: 18,
                            right: 16,
                          ).r,
                          child: SvgPicture.asset(AppImageStrings.search),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
                      ),
                      labelText: "Search",
                      labelStyle: TextStyle(
                        color: AppColors.searchHint,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 46.h,),
              Padding(
                padding: const EdgeInsets.only(left: 0).r,
                child: CategoryTabs(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
