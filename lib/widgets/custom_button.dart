import 'package:flutter/material.dart';
import 'package:walletric/config/colors.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? buttoncolor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Gradient? buttongradientColor;
  const CustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.height = 50,
    this.width = double.infinity,
    this.buttoncolor = Palette.themeColor,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ),
    this.border,
    this.buttongradientColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttoncolor,
          borderRadius: borderRadius,
          gradient: buttongradientColor,
          border: border,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

// class FigmaGradientButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final double? width;
//   final double? height;

//   const FigmaGradientButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.width,  // optional
//     this.height, // optional
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       borderRadius: BorderRadius.circular(11.73),
//       elevation: 2,
//       child: Ink(
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             transform: GradientRotation(319.59 * 3.1416 / 180),
//             colors: [
//               Color(0xFF005694),
//               Color(0xFF0090FF),
//             ],
//             stops: [0.0746, 0.544],
//           ),
//           // boxShadow: const [
//           //   BoxShadow(
//           //     color: Color(0x7A253EA7),
//           //     offset: Offset(0, 1.17),
//           //     blurRadius: 2.35,
//           //   ),
//           // ],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(12),
//           onTap: onPressed,
//           splashColor: Colors.white.withOpacity(0.2),
//           highlightColor: Colors.white.withOpacity(0.1),
//           child: Container(
//             width: width ?? 327.36,
//             height: height ?? 56.32,
//             alignment: Alignment.center,
//             child: Text(
//               text,
//               style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class FigmaGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final bool isEnabled;
  final TextStyle? style;
  final Color? backgroundColor;
  const FigmaGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.style,
    this.isEnabled = true, // default true
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      transform: GradientRotation(319.59 * 3.1416 / 180),
      colors: [
        Color(0xFF005694),
        Color(0xFF0090FF),
      ],
      stops: [0.0746, 0.544],
    );

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(11.73),
      elevation: isEnabled ? 2 : 0,
      child: Ink(
        decoration: BoxDecoration(
          // color: backgroundColor,

          gradient: backgroundColor != null
              ? null
              : isEnabled
                  ? gradient
                  : null,
          color:backgroundColor ?? (isEnabled
              ? null
              : Colors.grey.shade400), // disabled color
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: isEnabled ? onPressed : null,
          splashColor:
              isEnabled ? Colors.white.withOpacity(0.2) : Colors.transparent,
          highlightColor:
              isEnabled ? Colors.white.withOpacity(0.1) : Colors.transparent,
          child: Container(
            width: width ?? 327.36,
            height: height ?? 56.32,
            alignment: Alignment.center,
            child: Text(
              text,
              style: style ??
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
