import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// =========================================================================
//                  --- DUMMY/SUPPORTING CLASSES ---
// =========================================================================

class AppColors {
  static const Color blackText = Colors.black;
  static const Color searchHint = Colors.grey;
  static const Color textFieldBackground = Color(0xFFE0E0E0);
  static const Color primaryOrange = Color(0xFFFF5722);
  static const Color primaryRed = Color(0xFFFA4A0C);
  static const Color lightGrey = Color(0xFFC7C7C7);
  static const Color textBody = Color(0xFF9A9A9D);
}

class AppImageStrings {
  static const String menu = 'assets/svgs/menu.svg';
  static const String shoppingCart = 'assets/svgs/cart.svg';
  static const String search = 'assets/svgs/search.svg';

  static const String navHeart = 'assets/svgs/heart.svg';
  static const String navUser = 'assets/svgs/user.svg';
  static const String navHistory = 'assets/svgs/history.svg';
}

// =========================================================================
//                  --- 1. CATEGORY BUTTON WIDGET ---
// =========================================================================

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

// =========================================================================
//                  --- 2. CATEGORY TABS WIDGET ---
// =========================================================================

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

// =========================================================================
//                  --- 3. FOOD CARD WIDGET ---
// =========================================================================

class FoodCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePlaceholder;

  const FoodCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 321.h,
      margin: EdgeInsets.only(right: 20.w),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 220.w,
              height: 270.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryRed.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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

          Positioned(
            top: 0,
            child: Container(
              height: 140.r,
              width: 140.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  imagePlaceholder,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =========================================================================
//                  --- 4. HISTORY PAGE WIDGET ---
// =========================================================================

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Bar (Back Button and Title)
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back_ios, color: AppColors.blackText),
                  SizedBox(width: 100.w),
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

              // Empty State Content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Calendar Icon (106.5 x 118.33)
                      SizedBox(
                        width: 106.5.w,
                        height: 118.33.h,
                        child: Icon(
                          Icons.calendar_month,
                          size: 100.r,
                          color: AppColors.lightGrey,
                        ),
                      ),

                      SizedBox(height: 30.h),

                      // No history yet (193 x 33)
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

                      // Hit the orange button (220 x 40)
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

              // Orange Button ("Start ordering") (314 x 70)
              Padding(
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

// =========================================================================
//                  --- 5. HOME SCREEN CONTENT ---
// =========================================================================

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOP SECTION (Menu, Cart, Title, Search)
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
                // SEARCH BAR
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
                            ),
                            child: SvgPicture.asset(AppImageStrings.search),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          color: AppColors.searchHint,
                          fontSize: 17,
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

          // CATEGORIES (Horizontal List)
          Padding(
            padding: const EdgeInsets.only(left: 50.0).r,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: CategoryTabs(),
            ),
          ),

          SizedBox(height: 10.h),

          // FOOD CARDS HORIZONTAL LIST
          SizedBox(
            height: 380.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 50.0).r,
              children: const [
                FoodCard(title: "Veggie tomato mix", price: "N 1,900", imagePlaceholder: "🍅🥗"),
                FoodCard(title: "Fish sauce and mix", price: "N 2,300", imagePlaceholder: "🐟🌶️"),
                FoodCard(title: "Rice & Chicken", price: "N 1,500", imagePlaceholder: "🍚🍗"),
              ],
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}

// =========================================================================
//           --- 6. CUSTOM BOTTOM NAVIGATION BAR (MODIFIED) ---
// =========================================================================

class FoodAppBottomNav extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const FoodAppBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<FoodAppBottomNav> createState() => _FoodAppBottomNavState();
}

class _FoodAppBottomNavState extends State<FoodAppBottomNav> {

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
    final homeIconSize = widget.selectedIndex == 0 ? 32.0.r : 28.0.r;
    final homeIconColor = widget.selectedIndex == 0 ? AppColors.primaryOrange : Colors.grey.shade600;

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
        currentIndex: widget.selectedIndex,
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: Colors.grey.shade600,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: widget.onItemTapped,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              widget.selectedIndex == 0 ? Icons.home : Icons.home_outlined,
              size: homeIconSize,
              color: homeIconColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(AppImageStrings.navHeart, isSelected: widget.selectedIndex == 1, size: 28.0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(AppImageStrings.navUser, isSelected: widget.selectedIndex == 2, size: 28.0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(AppImageStrings.navHistory, isSelected: widget.selectedIndex == 3, size: 28.0),
            label: '',
          ),
        ],
      ),
    );
  }
}

// =========================================================================
//                          --- 7. MAIN ENTRY POINT (MODIFIED) ---
// =========================================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // All screens in the navigation flow
  final List<Widget> _screens = [
    const HomeScreenContent(),  // Index 0: Home Screen (with Scrollable Content)
    const Center(child: Text("Likes Screen")), // Index 1: Placeholder
    const Center(child: Text("Profile Screen")), // Index 2: Placeholder
    const HistoryPage(),        // Index 3: History Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // Bottom Nav Bar, jo index change karega
      bottomNavigationBar: FoodAppBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),

      // IndexedStack screens ko handle karega
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
    );
  }
}