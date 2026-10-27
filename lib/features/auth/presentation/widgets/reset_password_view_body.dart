import 'package:flutter/material.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/app_text_field.dart';
import 'reset_password_icon.dart';
import 'password_requirements_card.dart';
import '../../../../core/widgets/primary_button.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Screen header
          const AppTopBar(title: 'تعيين كلمة السر'),

          const SizedBox(height: 16),

          // Reset password illustration
          const ResetPasswordIcon(),

          const SizedBox(height: 1),

          // Screen title
          const SizedBox(
            width: 141,
            height: 24,
            child: Text(
              'كلمه مرور جديده',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 1.0,
                color: Color(0xFF272727),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Screen description
          const SizedBox(
            width: 320,
            height: 32,
            child: Text(
              'أدخل كلمة المرور الجديدة لحسابك وتأكد من حفظها جيداً لاستعادة الوصول إلى خدمات غسيل نيفو الذكية.',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.0,
                color: Color(0xFF737373),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // New password field
          // New password field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextField(
              label: 'كلمة المرور الجديدة',
              hint: '........',
              labelFontSize: 13,
              height: 48,
              obscureText: _obscurePassword,

              // Update password strength while typing
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },

              prefixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                child: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20,
                  color: const Color(0xFF737373),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Confirm new password field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextField(
              label: 'تأكيد كلمة المرور الجديدة',
              hint: '........',
              labelFontSize: 13,
              height: 48,
              obscureText: _obscureConfirmPassword,
              prefixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
                child: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20,
                  color: const Color(0xFF737373),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Password strength and requirements
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PasswordRequirementsCard(password: _password),
          ),
          const SizedBox(height: 24),

          // Save password button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              label: 'حفظ كلمة المرور والدخول',
              icon: Icons.arrow_back,
              height: 48,
              borderRadius: 12,
              showShadow: true,
              onPressed: () {
                // TODO: Validate and save password
              },
            ),
          ),
          const SizedBox(height: 25),

          // Technical support text
          const SizedBox(
            height: 12,
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'هل تواجه مشكلة؟ ',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: 'تواصل مع الدعم الفني لنيفو',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 10,
                  height: 1.0,
                  color: Color(0xFF737373),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
