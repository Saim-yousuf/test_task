import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/config/colors.dart';
import 'package:test_task/provider/bottom_nav_pro.dart';
import 'package:test_task/utils/image_path.dart';
import 'package:test_task/views/home/home_screen.dart';
import 'package:test_task/views/mood/mood_screen.dart';
import 'package:test_task/views/plan/plan_screen.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavPro>(context);
    final selectedIndex = provider.selectedIndex;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(color: Colors.grey[900]!, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            provider.setIndex(value);
          },
          backgroundColor: Palette.background,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Palette.white,
          unselectedItemColor: Palette.textMuted,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                AssetsPath.png.nutrition,
                color: selectedIndex == 0 ? Palette.white : Palette.textMuted,
                height: 24,
                width: 24,
              ),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AssetsPath.png.plan,
                color: selectedIndex == 1 ? Palette.white : Palette.textMuted,
                height: 24,
                width: 24,
              ),
              label: 'Plan',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AssetsPath.png.mood,
                color: selectedIndex == 2 ? Palette.white : Palette.textMuted,
                height: 24,
                width: 24,
              ),
              label: 'Mood',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AssetsPath.png.profile,
                color: selectedIndex == 3 ? Palette.white : Palette.textMuted,
                height: 24,
                width: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: selectedIndex == 0
          ? const HomeScreen()
          : selectedIndex == 1
              ? const PlanScreen()
              : selectedIndex == 2
                  ? const MoodTrackerScreen()
                  : const Scaffold(
                      body: Center(
                        child: Text(
                          "Comming Soon",
                          style: TextStyle(color: Palette.white, fontSize: 30),
                        ),
                      ),
                    ),
    );
  }
}
