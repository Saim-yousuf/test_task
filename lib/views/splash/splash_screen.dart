import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_task/config/colors.dart';
import 'package:test_task/go_routes/go_navigator.dart';
import 'package:test_task/go_routes/go_router.dart';
import 'package:test_task/utils/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      Go.namedReplace(context, RouteName.navbar);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Palette.secondary.withOpacity(0.4),
              Palette.black,
              Palette.black,
              Palette.black,
            ],
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: FadeTransition(
              opacity: _animation,
              child: Image.asset(
                AssetsPath.png.happy,
                width: 250,
                height: 250,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
