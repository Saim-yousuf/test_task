import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:walletric/config/colors.dart';
import 'package:walletric/config/scroll_behavior.dart';
import 'package:walletric/go_routes/go_router.dart';
import 'package:walletric/helper/shared_prefences/preference_helper.dart';
import 'package:walletric/provider/app/bottom_nav_pro.dart';
import 'package:walletric/provider/auth/auth_provider.dart';
import 'package:walletric/repository/auth/auth_repo.dart';
import 'package:walletric/utils/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.getInstance();

  Api.init(Environment.live);

  runApp(
    MultiProvider(providers: [
      Provider(create: (_) => AuthRepo()),
      ChangeNotifierProvider(
        create: (context) => AuthPro(context.read<AuthRepo>()),
      ),
      Provider(create: (_) => AuthRepo()),
      ChangeNotifierProvider(
        create: (context) => AuthPro(context.read<AuthRepo>()),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomNavPro(),
      ),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _routes = RouteName();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Walletric',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Palette.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Palette.black,
          surfaceTintColor: Palette.black,
          iconTheme: const IconThemeData(color: Palette.white),
          titleTextStyle: GoogleFonts.poppins(
            color: Palette.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.themeColor,
          brightness: Brightness.light,
        ).copyWith(
          surface: Palette.white,
          onSurface: Palette.black,
          primary: Palette.themeColor,
          onPrimary: Palette.white,
          secondary: Palette.secondary,
          onSecondary: Palette.white,
        ),
        fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(color: Palette.black),
            bodyMedium: TextStyle(color: Palette.black),
            titleLarge: TextStyle(color: Palette.black),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _routes.myrouter,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
// Provider(create: (_) => WithdrawRepository()),
//         ChangeNotifierProvider(
//           create: (context) => WithdrawPro(context.read<WithdrawRepository>()),
//           lazy: false,
//         ),
