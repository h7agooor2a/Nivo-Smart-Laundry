import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class AppBottomNavBar extends StatelessWidget {
  final ValueChanged<int>? onTap;
  final int currentIndex;

  const AppBottomNavBar({super.key, this.onTap, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.gray,
        selectedLabelStyle: AppTextStyle.mediumTitle11(context),
        unselectedLabelStyle: AppTextStyle.mediumTitle11(
          context,
          fontWeight: FontWeight.w500,
        ),
        items: [
          // Home
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: AppStrings.home,
          ),

          // Services
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.servicesIcon, width: 24, height: 24),
            activeIcon: Image.asset(
              AppAssets.servicesIcon,
              width: 24,
              height: 24,
              color: AppColors.secondaryColor,
            ),
            label: AppStrings.services,
          ),

          // AI Assistant
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.aiAssistantIcon, width: 24, height: 24),
            label: AppStrings.aiAssistant,
          ),

          // Orders
          BottomNavigationBarItem(
            icon: const Icon(Icons.receipt_long_outlined),
            label: AppStrings.orders,
          ),

          // Profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 22.w),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}
