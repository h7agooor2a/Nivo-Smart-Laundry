import 'package:flutter/material.dart';

class PasswordRequirementsCard extends StatelessWidget {
  const PasswordRequirementsCard({super.key, required this.password});

  final String password;

  // Password validation rules
  bool get hasMinLength => password.length >= 8;

  bool get hasUppercaseAndNumber =>
      RegExp(r'[A-Z]').hasMatch(password) &&
      RegExp(r'[0-9]').hasMatch(password);

  bool get hasSpecialCharacter =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]').hasMatch(password);

  int get strengthScore {
    int score = 0;

    if (hasMinLength) score++;
    if (hasUppercaseAndNumber) score++;
    if (hasSpecialCharacter) score++;

    return score;
  }

  String get strengthText {
    switch (strengthScore) {
      case 1:
        return 'ضعيفة';
      case 2:
        return 'متوسطة';
      case 3:
        return 'قوية ومثالية';
      default:
        return 'أدخل كلمة المرور';
    }
  }

  Color get strengthColor {
    switch (strengthScore) {
      case 1:
        return const Color(0xFFF51D23);
      case 2:
        return const Color(0xFFF51D23);
      case 3:
        return const Color(0xFFF51D23);
      default:
        return const Color(0xFFF51D23);
    }
  }

  @override
  Widget build(BuildContext context) {
    final score = strengthScore;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5F3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Password strength header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'قوة كلمة المرور',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    color: Color(0xFF737373),
                  ),
                ),

                Text(
                  strengthText,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    color: strengthColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Strength progress bars
            Row(
              children: List.generate(3, (index) {
                final isActive = index < score;

                return Expanded(
                  child: Container(
                    height: 6,
                    margin: EdgeInsetsDirectional.only(
                      start: index == 0 ? 0 : 6,
                    ),
                    decoration: BoxDecoration(
                      color: isActive ? strengthColor : const Color(0xFFFFB4AB),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 12),

            // Password requirements
            _RequirementItem(text: '8 أحرف على الأقل', isValid: hasMinLength),

            const SizedBox(height: 8),

            _RequirementItem(
              text: 'حرف كبير ورقم واحد على الأقل',
              isValid: hasUppercaseAndNumber,
            ),

            const SizedBox(height: 8),

            _RequirementItem(
              text: 'رمز خاص واحد (#، \$، !)',
              isValid: hasSpecialCharacter,
            ),
          ],
        ),
      ),
    );
  }
}

// Single password requirement item
class _RequirementItem extends StatelessWidget {
  const _RequirementItem({required this.text, required this.isValid});

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFFD6D2),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.check, size: 14, color: Color(0xFFF51D23)),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Color(0xFF545454),
            ),
          ),
        ),
      ],
    );
  }
}
