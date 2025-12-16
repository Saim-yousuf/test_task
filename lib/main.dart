import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:test_task/config/colors.dart';
import 'package:test_task/config/scroll_behavior.dart';
import 'package:test_task/go_routes/go_router.dart';
import 'package:test_task/provider/bottom_nav_pro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(providers: [
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
      title: 'Test Task',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      routerConfig: _routes.myrouter,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Palette.background,
        appBarTheme: AppBarTheme(
          backgroundColor: Palette.background,
          surfaceTintColor: Palette.background,
          elevation: 0,
          iconTheme: const IconThemeData(color: Palette.white),
          titleTextStyle: GoogleFonts.mulish(
            color: Palette.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.primary,
          brightness: Brightness.dark,
        ).copyWith(
          primary: Palette.primary,
          onPrimary: Palette.white,
          secondary: Palette.secondary,
          onSecondary: Palette.white,
          background: Palette.background,
          onBackground: Palette.white,
          surface: Palette.card,
          onSurface: Palette.white,
          error: Palette.error,
        ),
        cardTheme: const CardTheme(
          color: Palette.card,
          elevation: 0,
          surfaceTintColor: Palette.card,
        ),
        fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(color: Palette.textPrimary),
            bodyMedium: TextStyle(color: Palette.textPrimary),
            bodySmall: TextStyle(color: Palette.textSecondary),
            titleLarge: TextStyle(
              color: Palette.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            titleMedium: TextStyle(color: Palette.textPrimary),
            titleSmall: TextStyle(color: Palette.textSecondary),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Palette.inputBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Palette.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Palette.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Palette.primary,
              width: 1.5,
            ),
          ),
          hintStyle: const TextStyle(color: Palette.textMuted),
        ),
        dividerTheme: const DividerThemeData(
          color: Palette.divider,
          thickness: 0.8,
        ),
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: const [
          Breakpoint(start: 0, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 800, name: TABLET),
          Breakpoint(start: 801, end: 1920, name: DESKTOP),
          Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
