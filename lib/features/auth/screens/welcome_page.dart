import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.welcomeBackground,
      body: Padding(
        padding: const EdgeInsets.only(top: 160,left: 51,right: 51).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Food for Everyone',style: TextStyle(
              color: AppColors.white,
              fontFamily: 'SfProRounded',
              fontSize: 65.sp,
              height: 0.868
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 36.0).r,
              child: GestureDetector(
                onTap: (){
                  context.go('/home');
                },
                child: Container(
                  width: 340.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                      color:AppColors.white,
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  child: Center(
                    child: Text('Get started',style: TextStyle(
                      color: AppColors.primaryOnWhite,
                      fontSize: 17.sp,
                      fontFamily: 'SfProText'
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
