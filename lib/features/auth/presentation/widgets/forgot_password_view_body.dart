import 'package:flutter/material.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../views/reset_password_view.dart';
import 'reset_password_icon.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  // true = via phone, false = via email
  bool _viaPhone = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AppTopBar(title: 'اعادة تعيين كلمة السر'),

          const SizedBox(height: 16),

          // Shared reset password illustration
          const ResetPasswordIcon(),

          const SizedBox(height: 12),

          const Text(
            'نسيت كلمة المرور؟',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.0,
              color: Color(0xFF272727),
            ),
          ),

          const SizedBox(height: 8),

          const SizedBox(
            width: 320,
            child: Text(
              'لا تقلق! أدخل رقم هاتفك أو بريدك الإلكتروني المسجل وسنرسل لك رمز تحقق لإعادة تعيين كلمة المرور.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.25,
                color: Color(0xFF737373),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Contact method selection card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0D000000),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _MethodTabs(
                    viaPhone: _viaPhone,
                    onChanged: (value) {
                      setState(() {
                        _viaPhone = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Contact field changes based on selected method
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _viaPhone
                        ? const _ContactField(
                            key: ValueKey('phone'),
                            label: 'رقم الهاتف المحمول',
                            hint: '5678 1234 010',
                            note:
                                'سنرسل رسالة نصية قصيرة SMS تحتوي على كود مكوّن من 4 أرقام.',
                            isPhone: true,
                          )
                        : const _ContactField(
                            key: ValueKey('email'),
                            label: 'البريد الالكتروني',
                            hint: 'name@example.com',
                            note:
                                'سنرسل رمز تحقق مكوّن من 4 أرقام إلى بريدك الإلكتروني',
                            isPhone: false,
                          ),
                  ),

                  const SizedBox(height: 16),

                  PrimaryButton(
                    label: 'إرسال رمز التحقق (OTP)',
                    icon: Icons.send,
                    flipIcon: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // WhatsApp support banner
          const _WhatsAppSupportBanner(),

          const SizedBox(height: 24),

          // Back to login
          const _BackToLogin(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// Contact method tabs
class _MethodTabs extends StatelessWidget {
  const _MethodTabs({required this.viaPhone, required this.onChanged});

  final bool viaPhone;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F7FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: _Tab(
                label: 'عبر الهاتف',
                icon: Icons.smartphone,
                selected: viaPhone,
                onTap: () => onChanged(true),
              ),
            ),

            const SizedBox(width: 6),

            Expanded(
              child: _Tab(
                label: 'عبر البريد',
                icon: Icons.mail_outline,
                selected: !viaPhone,
                onTap: () => onChanged(false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact method tab
class _Tab extends StatelessWidget {
  const _Tab({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : const Color(0xFF272727);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1A37FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: color),

            const SizedBox(width: 6),

            Text(
              label,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                height: 1.0,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Phone or email input field
class _ContactField extends StatelessWidget {
  const _ContactField({
    super.key,
    required this.label,
    required this.hint,
    required this.note,
    required this.isPhone,
  });

  final String label;
  final String hint;
  final String note;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Field label
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 13,
              fontWeight: FontWeight.w700,
              height: 1.0,
              color: Color(0xFF272727),
            ),
          ),

          const SizedBox(height: 8),

          // Input container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FBFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  isPhone ? Icons.smartphone : Icons.mail_outline,
                  size: 20,
                  color: const Color(0xFF737373),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: TextField(
                    keyboardType: isPhone
                        ? TextInputType.phone
                        : TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 13,
                      color: Color(0xFF272727),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      hintText: hint,
                      hintStyle: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 13,
                        color: Color(0xFFA2A2A2),
                      ),
                    ),
                  ),
                ),

                if (isPhone) ...[
                  const SizedBox(width: 8),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6EEFF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      '+20 🇪🇬',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        color: Color(0xFF1A37FF),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 6),

          // Field description
          Text(
            note,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.2,
              color: Color(0xFFA2A2A2),
            ),
          ),
        ],
      ),
    );
  }
}

// WhatsApp support banner
class _WhatsAppSupportBanner extends StatelessWidget {
  const _WhatsAppSupportBanner();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 64,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              // Right circle and support texts
              _WhatsAppSupportContent(),

              // Left arrow
              _BannerChevronLeft(),
            ],
          ),
        ),
      ),
    );
  }
}

// WhatsApp circle and text content
class _WhatsAppSupportContent extends StatelessWidget {
  const _WhatsAppSupportContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _WhatsAppCircleIcon(),

        SizedBox(width: 12),

        _WhatsAppTexts(),
      ],
    );
  }
}

// WhatsApp circle icon
class _WhatsAppCircleIcon extends StatelessWidget {
  const _WhatsAppCircleIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x1A16A34A),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/Auth/whatsapp_support_icon.png',
        width: 20,
        height: 20,
        fit: BoxFit.contain,
      ),
    );
  }
}

// WhatsApp support texts
class _WhatsAppTexts extends StatelessWidget {
  const _WhatsAppTexts();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'تحتاج مساعدة فورية؟',
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            height: 1.0,
            color: Color(0xFF404040),
          ),
        ),

        SizedBox(height: 4),

        Text(
          'تواصل مع الدعم الفني عبر الواتساب',
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.0,
            color: Color(0xFF737373),
          ),
        ),
      ],
    );
  }
}

// Left arrow
class _BannerChevronLeft extends StatelessWidget {
  const _BannerChevronLeft();

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Icon(Icons.chevron_left, size: 20, color: Color(0xFF737373)),
    );
  }
}

// Back to login section
class _BackToLogin extends StatelessWidget {
  const _BackToLogin();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'تذكرت كلمة المرور؟',
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Color(0xFF737373),
            ),
          ),

          const SizedBox(width: 6),

          GestureDetector(
            onTap: () {
              // Navigate back to login screen
              Navigator.pop(context);
            },
            child: const Text(
              'تسجيل الدخول',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                height: 1.0,
                color: Color(0xFFFE574F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
