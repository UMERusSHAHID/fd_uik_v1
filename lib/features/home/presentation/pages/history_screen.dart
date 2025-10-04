import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
// flutter_svg import rehne den

// =========================================================================
//                  --- 1. FOOD CARD WIDGET (UPDATED) ---
// =========================================================================

class FoodCard extends StatelessWidget {
  final String title;
  final String price;
  // String imagePlaceholder ki jagah ab aap actual path use karenge agar image available ho
  final String imagePath; // For actual image or placeholder asset

  const FoodCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath, // e.g., 'assets/images/veggie_mix.png'
  });

  @override
  Widget build(BuildContext context) {
    // Dimensions jo aapne di hain: width: 220, height: 321
    return Container(
      width: 220.w,
      height: 321.h,
      margin: EdgeInsets.only(right: 20.w), // Horizontal spacing ke liye

      child: Stack(
        // Stack ka alignment top-center, taake image upar rahe
        alignment: Alignment.topCenter,
        children: [
          // 1. White Card/Container (Bottom Part)
          Positioned(
            bottom: 0,
            child: Container(
              width: 220.w,
              height: 270.h, // Card ki height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                // Card ka shadow (design se adjust kiya gaya)
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 10), // Shadow niche ki taraf
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 100.h), // Image ke liye space
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title Text
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.blackText,
                          fontSize: 22.sp,
                          fontFamily: 'SfProRounded',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // Price Text
                    Text(
                      price,
                      style: TextStyle(
                        color: AppColors.primaryRed,
                        fontSize: 17.sp,
                        fontFamily: 'SfProRounded',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Circular Image/Placeholder (Top Part)
          Positioned(
            top: 0,
            child: Container(
              height: 140.r, // Circular image size
              width: 140.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent, // Image will go here
              ),
              // Agar aapke paas actual image hai, toh yahan use karein
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  // Agar image load nahi hui, toh placeholder
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.lightGrey.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: Text(
                        "Image Missing",
                        style: TextStyle(fontSize: 12.sp, color: AppColors.blackText),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}