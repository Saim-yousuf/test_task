import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:walletric/views/splash/splash_screen.dart';

class RouteName {
  static const String splashScreen = 'splash';
  static const String signin = 'signin';
  static const String signup = 'signup';
  static const String signupOtp = 'signup/otp';
  static const String navbar = 'navbar';
  static const String completeProfile = 'completeProfile';
  static const String forgotPassword = 'forgotPassword';
  static const String forgotOtp = 'forgot/otp';
  static const String createPassword = 'forgot/create-password';
  static const String changePassword = 'change-password';
  static const String faq = 'faq';
  static const String privacyPolicy = 'privacyPolicy';
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
    
    ],
  );
}
