import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Primary call-to-action button used across the app
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.flipIcon = false,
    this.height = 51,
    this.borderRadius = 16,
    this.showShadow = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  /// Mirrors the icon horizontally
  final bool flipIcon;

  /// Button height
  final double height;

  /// Button border radius
  final double borderRadius;

  /// Enables Figma button shadow
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: showShadow
              ? const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: -2,
                  ),
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -1,
                  ),
                ]
              : null,
        ),
        child: Material(
          color: const Color(0xFFFE574F),
          borderRadius: BorderRadius.circular(borderRadius),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        color: Colors.white,
                      ),
                    ),

                    if (icon != null) ...[
                      const SizedBox(width: 8),

                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: flipIcon
                              ? Matrix4.rotationY(math.pi)
                              : Matrix4.identity(),
                          child: Icon(icon, size: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
