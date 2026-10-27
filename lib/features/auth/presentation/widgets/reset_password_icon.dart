import 'package:flutter/material.dart';

class ResetPasswordIcon extends StatelessWidget {
  const ResetPasswordIcon({super.key});

  static const double _bigSize = 104;
  static const double _badgeSize = 28;
  static const double _topOffset = 12;

  static const double _dx = 41;
  static const double _dy = 41;

  @override
  Widget build(BuildContext context) {
    const centerX = _bigSize / 2 + _badgeSize / 2;
    const centerY = _topOffset + _bigSize / 2;

    return SizedBox(
      width: _bigSize + _badgeSize,
      height: _bigSize + _topOffset,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Outer light circle
          Positioned(
            left: _badgeSize / 2,
            top: _topOffset,
            child: Container(
              width: _bigSize,
              height: _bigSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE6EEFF),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0D000000),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/Auth/reset_lock.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),

          // Small badge
          Positioned(
            left: centerX + _dx - _badgeSize / 2,
            top: centerY - _dy - _badgeSize / 2,
            child: Container(
              width: _badgeSize,
              height: _badgeSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF1A37FF),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Auth/badge_laundry.png',
                width: 16,
                height: 16,
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
