import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// =========================================================================
//                  --- DUMMY/SUPPORTING CLASSES ---
// =========================================================================

// Dummy colors for consistency
class AppColors {
  static const Color blackText = Colors.black;
  static const Color primaryRed = Color(0xFFFA4A0C); // Main active color
  static const Color lightGrey = Color(0xFFC7C7C7);
  static const Color textBody = Color(0xFF9A9A9D); // For description text
}

// Dummy icon strings
class AppImageStrings {
  // Assuming a generic back arrow and a placeholder for the calendar icon
  static const String backArrow = 'assets/svgs/arrow_back.svg';
  static const String calendarIcon = 'assets/svgs/calendar.svg'; // Placeholder
}

// =========================================================================
//                          --- HISTORY PAGE WIDGET ---
// =========================================================================

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil init karna zaroori hai agar aap use kar rahe hain
    // Ya phir use karke dekhna hoga ki dimensions sahi dikh rahe hain
    // ScreenUtil.init(context, designSize: const Size(414, 896)); // Example design size

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            children: [
              // 1. App Bar (Back Button and Title)
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Placeholder for back button (using Material Icon for simplicity)
                  const Icon(Icons.arrow_back_ios, color: AppColors.blackText),
                  SizedBox(width: 100.w), // Space for centering title
                  Text(
                    "History",
                    style: TextStyle(
                      color: AppColors.blackText,
                      fontSize: 18.sp,
                      fontFamily: 'SfProRounded',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              // 2. Empty State Content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Calendar Image/Icon (Dimensions: 106.5 x 118.33)
                      SizedBox(
                        width: 106.5.w,
                        height: 118.33.h,
                        child: Icon(
                          Icons.calendar_month, // Using a Material Icon for Calendar
                          size: 100.r,
                          color: AppColors.lightGrey,
                        ),
                      ),

                      SizedBox(height: 30.h),

                      // No history yet (Dimensions: width: 193, height: 33)
                      SizedBox(
                        width: 193.w,
                        height: 33.h,
                        child: Text(
                          "No history yet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blackText,
                            fontSize: 28.sp,
                            fontFamily: 'SfProRounded',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      SizedBox(height: 17.h),

                      // Hit the orange button (Dimensions: width: 220, height: 40)
                      SizedBox(
                        width: 220.w,
                        height: 40.h,
                        child: Text(
                          "Hit the orange button down\nbelow to Create an order",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textBody.withOpacity(0.57),
                            fontSize: 17.sp,
                            fontFamily: 'SfProRounded',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 3. Orange Button ("Start ordering")
              Padding(
                // Yeh padding left: 50px se align karne ke liye hai (Parent Padding 50.w hai)
                padding: EdgeInsets.only(bottom: 40.h),
                child: Container(
                  width: 314.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryRed.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Start ordering",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontFamily: 'SfProRounded',
                        fontWeight: FontWeight.w600,
                      ),
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