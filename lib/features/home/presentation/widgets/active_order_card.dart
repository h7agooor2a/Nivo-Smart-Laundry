import 'package:flutter/material.dart';
import 'order_progress_stepper.dart';
import 'active_order_footer.dart';

class ActiveOrderCard extends StatelessWidget {
  const ActiveOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
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
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ActiveOrderHeader(),

          SizedBox(height: 12),

          OrderProgressStepper(),

          SizedBox(height: 24),

          ActiveOrderFooter(),
        ],
      ),
    );
  }
}

class _ActiveOrderHeader extends StatelessWidget {
  const _ActiveOrderHeader();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Order information
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFE6EEFF),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/Auth/badge_laundry.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طلب نشط',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: Color(0xFF737373),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '#SL-9402',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      color: Color(0xFF272727),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Order status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFD0DFFF),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.autorenew, size: 16, color: Color(0xFF1A37FF)),
                SizedBox(width: 6),
                Text(
                  'قيد الغسيل والتعقيم',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    color: Color(0xFF1A37FF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
