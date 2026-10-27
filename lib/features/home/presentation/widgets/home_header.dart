import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home title and icon
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0x1A1A37FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.home_outlined,
                    size: 20,
                    color: Color(0xFF1A37FF),
                  ),
                ),

                const SizedBox(width: 8),

                const Text(
                  'الرئيسية',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF01002F),
                  ),
                ),
              ],
            ),

            // Notifications and logo
            // Notifications and logo
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Notification icon
                SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      // TODO: Navigate to notifications
                    },
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      size: 24,
                      color: Color(0xFF737373),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Nivo logo
                Image.asset(
                  'assets/images/welcome/nivo_logo_only.png',
                  width: 72,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
