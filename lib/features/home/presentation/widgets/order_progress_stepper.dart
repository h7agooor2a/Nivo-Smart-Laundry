import 'package:flutter/material.dart';

class OrderProgressStepper extends StatelessWidget {
  const OrderProgressStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_ReceivedStep(), _ProcessingStep(), _ReadyStep()],
          ),

          SizedBox(height: 8),

          _OrderProgressBar(progress: 0.654),
        ],
      ),
    );
  }
}

class _ReceivedStep extends StatelessWidget {
  const _ReceivedStep();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check_circle_outline, size: 14, color: Color(0xFFF51D23)),
        SizedBox(width: 2),
        Text(
          'تم الاستلام',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 10,
            fontWeight: FontWeight.w700,
            height: 1.0,
            color: Color(0xFFF51D23),
          ),
        ),
      ],
    );
  }
}

class _ProcessingStep extends StatelessWidget {
  const _ProcessingStep();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 14,
          height: 14,
          child: CircularProgressIndicator(
            strokeWidth: 1.8,
            color: Color(0xFF1A37FF),
          ),
        ),
        SizedBox(width: 2),
        Text(
          'المعالجة والكوي',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 10,
            fontWeight: FontWeight.w700,
            height: 1.0,
            color: Color(0xFF1A37FF),
          ),
        ),
      ],
    );
  }
}

class _ReadyStep extends StatelessWidget {
  const _ReadyStep();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'جاهز للتسليم',
      style: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 1.0,
        color: Color(0xFF737373),
      ),
    );
  }
}

class _OrderProgressBar extends StatelessWidget {
  final double progress;

  const _OrderProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFE6EEFF),
              borderRadius: BorderRadius.circular(9999),
            ),
          ),
          FractionallySizedBox(
            widthFactor: progress.clamp(0.0, 1.0),
            alignment: Alignment.centerRight,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF1A37FF),
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
