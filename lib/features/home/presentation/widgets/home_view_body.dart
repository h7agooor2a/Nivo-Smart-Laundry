import 'package:flutter/material.dart';
import 'home_header.dart';
import 'home_welcome_section.dart';
import 'active_order_card.dart';
import 'new_order_hero_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // White header
        const HomeHeader(),

        // Main home content
        Expanded(
          child: Container(
            width: double.infinity,
            color: const Color(0xFFF8F9FC),
            child: const SingleChildScrollView(
              padding: EdgeInsets.only(top: 12, bottom: 20),
              child: Column(
                children: [
                  HomeWelcomeSection(),

                  SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ActiveOrderCard(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
