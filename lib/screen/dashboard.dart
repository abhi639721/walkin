import 'package:flutter/material.dart';
import 'package:walkin/generated/assets.dart';
import 'package:walkin/screen/home.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EEEA),
      // backgroundColor: Color(0xFFEDF9FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFEFE5BC),

        leadingWidth: 120,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 12),
            Image.asset(Assets.iconsLocation, width: 24, height: 24),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New Delhi',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '20228',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,

        actions: [
          IconButton(
            icon: Image.asset(Assets.iconsSearch, width: 24, height: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(Assets.iconsBell, width: 24, height: 24),
            onPressed: () {},
          ),
        ],
      ),

      body: HomeScreen(),
    );
  }
}
