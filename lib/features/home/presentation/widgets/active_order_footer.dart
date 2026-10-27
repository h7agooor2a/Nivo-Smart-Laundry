import 'package:flutter/material.dart';

class ActiveOrderFooter extends StatelessWidget {
  const ActiveOrderFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'التسليم المتوقع:',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    color: Color(0xFF737373),
                  ),
                ),
                const SizedBox(width: 2),
                const Flexible(
                  child: Text(
                    'اليوم 07:30 م',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      color: Color(0xFF272727),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'متابعة الطلب',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    color: Color(0xFF1A37FF),
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_back, size: 16, color: Color(0xFF1A37FF)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
