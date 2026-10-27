import 'package:flutter/material.dart';

class HomeWelcomeSection extends StatelessWidget {
  const HomeWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome texts
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرحباً أحمد',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      color: Color(0xFF01002F),
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'ملابسك في أيد أمينة مع نيفو الذكي',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: Color(0xFF737373),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 4),

            // Location button
            Flexible(
              flex: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9999),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0D000000),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, size: 20, color: Color(0xFF1A37FF)),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'المعادي، القاهرة',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF01002F),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: Color(0xFF737373),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
