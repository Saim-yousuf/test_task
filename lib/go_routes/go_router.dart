import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/views/home/home_screen.dart';
import 'package:test_task/views/navbar/navbar.dart';

import 'package:test_task/views/splash/splash_screen.dart';

class RouteName {
  static const String splashScreen = 'splash';

  static const String navbar = 'navbar';

  GoRouter myrouter = GoRouter(
    errorPageBuilder: (context, state) {
      return const MaterialPage(
        child: Scaffold(),
      );
    },
    routes: [
      GoRoute(
        path: '/',
        name: splashScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: '/$navbar',
        name: navbar,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: BottomNavbar(),
          );
        },
      ),
    ],
  );
}
