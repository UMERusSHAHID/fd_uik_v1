import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppColors {
  static const Color blackText = Colors.black;
  static const Color searchHint = Colors.grey;
  static const Color textFieldBackground = Color(0xFFE0E0E0);
  static const Color primaryOrange = Color(0xFFFF5722);
  static const Color primaryRed = Color(0xFFFA4A0C);
  static const Color lightGrey = Color(0xFFC7C7C7);
}

class AppImageStrings {
  static const String menu = 'assets/svgs/menu.svg';
  static const String shoppingCart = 'assets/svgs/cart.svg';
  static const String search = 'assets/svgs/search.svg';

  // *** NAV BAR SVG PATHS ***
  static const String navHeart = 'assets/svgs/heart.svg';
  static const String navUser = 'assets/svgs/user.svg';
  static const String navHistory = 'assets/svgs/history.svg';
}


class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.primaryRed : AppColors.lightGrey,
                fontSize: 17.sp,
                fontFamily: 'SfProDisplay',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          // Underline Indicator
          if (isSelected)
            Container(
              height: 3.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.primaryRed,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
        ],
      ),
    );
  }
}



class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int _selectedIndex = 0;
  final List<String> categories = ['Foods', 'Drinks', 'Sauces', 'Desserts', 'Snacks'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryButton(
            title: categories[index],
            isSelected: _selectedIndex == index,
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}




class FoodAppBottomNav extends StatefulWidget {
  const FoodAppBottomNav({super.key});

  @override
  State<FoodAppBottomNav> createState() => _FoodAppBottomNavState();
}

class _FoodAppBottomNavState extends State<FoodAppBottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildSvgIcon(String assetPath, {required bool isSelected, required double size}) {
    Color color = isSelected ? AppColors.primaryOrange : Colors.grey.shade600;

    if (assetPath == AppImageStrings.navHistory && !isSelected) {
      color = color.withOpacity(0.4);
    }

    final double iconSize = size.r;

    return SvgPicture.asset(
      assetPath,
      height: iconSize,
      width: iconSize,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeIconSize = _selectedIndex == 0 ? 32.0.r : 28.0.r;
    final homeIconColor = _selectedIndex == 0 ? AppColors.primaryOrange : Colors.grey.shade600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: Colors.grey.shade600,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: _onItemTapped,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
              size: homeIconSize,
              color: homeIconColor,
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: _buildSvgIcon(AppImageStrings.navHeart, isSelected: _selectedIndex == 1, size: 28.0),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: _buildSvgIcon(AppImageStrings.navUser, isSelected: _selectedIndex == 2, size: 28.0),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: _buildSvgIcon(AppImageStrings.navHistory, isSelected: _selectedIndex == 3, size: 28.0),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: const FoodAppBottomNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 50, top: 74, right: 50).r,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImageStrings.menu),
                      SvgPicture.asset(AppImageStrings.shoppingCart),
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
                  SizedBox(height: 28.h),

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

                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: AppColors.searchHint,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 46.h),
                ],
              ),
            ),

            Padding(

              padding: const EdgeInsets.only(left: 50.0).r,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: CategoryTabs(),
              ),
            ),


            SizedBox(height: 20.h),
            const Center(
              child: Text(
                "Food Cards (Next Step)",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 500.h),
          ],
        ),
      ),
    );
  }
}