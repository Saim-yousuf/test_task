import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walletric/config/colors.dart';
import 'package:walletric/provider/app/bottom_nav_pro.dart';
import 'package:walletric/utils/image_path.dart';
import 'package:walletric/views/home/home_screen.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavPro>(context);
    final selectedIndex = provider.selectedIndex;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0xFFF5F5F9),
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
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF00B8A9),
          unselectedItemColor: Colors.grey[600],
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Plan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_outlined),
              label: 'Mood',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
      //  SizedBox(
      //   height: 80,
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       CustomPaint(
      //         size: const Size(double.infinity, 80),
      //         painter: _NavBarPainter(),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           _buildNavItem(context, AssetsPath.png.home, 0),
      //           _buildNavItem(context, AssetsPath.png.transfers, 1),
      //           const SizedBox(width: 60),
      //           _buildNavItem(context, AssetsPath.png.bookmark, 2),
      //           _buildNavItem(context, AssetsPath.png.profile, 3),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: HomeScreen(),
    );
  }

  Widget _buildNavItem(BuildContext context, String image, int index) {
    final provider = Provider.of<BottomNavPro>(context);
    final isSelected = provider.selectedIndex == index;

    return GestureDetector(
      onTap: () => provider.setIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSelected
              ? Container(
                  height: 3,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Palette.appColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                )
              : const SizedBox(height: 3, width: 25),
          Image.asset(image,
              color: isSelected ? Palette.appColor : Colors.black87),
          const SizedBox(),
        ],
      ),
    );
  }
}

class _NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    final path = Path()..moveTo(0, 0);

    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(size.width / 2 - 40, 0);
    path.quadraticBezierTo(size.width / 2, 110, size.width / 2 + 40, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black12, 4, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
