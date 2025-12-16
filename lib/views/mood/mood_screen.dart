import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_task/config/colors.dart';
import 'package:test_task/utils/image_path.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({Key? key}) : super(key: key);

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  double _angle = 0;
  late String _moodText;
  late Color _moodColor;
  late String _moodImage;

  @override
  void initState() {
    super.initState();
    _updateMood(300);
  }

  void _updateMood(double angle) {
    setState(() {
      _angle = angle;

      final normalizedAngle = (angle % 360 + 360) % 360;

      if (normalizedAngle < 90) {
        _moodText = 'Peaceful';
        _moodImage = AssetsPath.png.peaceful;
        _moodColor = const Color(0xFFF18EB1);
      } else if (normalizedAngle < 180) {
        _moodText = 'Content';
        _moodImage = AssetsPath.png.content;
        _moodColor = const Color(0xFFC9BBEE);
      } else if (normalizedAngle < 270) {
        _moodText = 'Happy';
        _moodImage = AssetsPath.png.happy;
        _moodColor = const Color(0xFFF79B59);
      } else {
        _moodText = 'Calm';
        _moodImage = AssetsPath.png.calm;
        _moodColor = const Color(0xFF6FBAAE);
      }
    });
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mood',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Start your day',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'How are you feeling at the\nMoment?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      final center = Offset(
                        MediaQuery.of(context).size.width / 2,
                        300,
                      );
                      final angle = atan2(
                        details.globalPosition.dy - center.dy,
                        details.globalPosition.dx - center.dx,
                      );
                      _updateMood(angle * 180 / pi);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          painter: MoodWheelPainter(angle: _angle),
                          size: const Size(280, 280),
                        ),
                        Image.asset(
                          _moodImage,
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  _moodText,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Palette.white,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoodWheelPainter extends CustomPainter {
  final double angle;

  MoodWheelPainter({required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..shader = const SweepGradient(
        colors: [
          Color(0xFFF18EB1), // Peaceful
          Color(0xFFC9BBEE), // Content
          Color(0xFFF79B59), // Happy
          Color(0xFF6FBAAE), // Calm
        ],
        stops: [0, 0.25, 0.5, 0.75],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius - 10),
      );

    canvas.drawCircle(center, radius - 10, paint);

    final linePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1.5;

    for (int i = 0; i < 8; i++) {
      final lineAngle = (i * 45) * pi / 180;
      final startX = center.dx + 40 * cos(lineAngle);
      final startY = center.dy + 40 * sin(lineAngle);
      final endX = center.dx + (radius - 10) * cos(lineAngle);
      final endY = center.dy + (radius - 10) * sin(lineAngle);

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        linePaint,
      );
    }

    canvas.drawCircle(
        center,
        radius - 40,
        Paint()
          ..color = const Color(0xFF1A2332)
          ..style = PaintingStyle.fill);

    final indicatorAngle = angle * pi / 180;
    final indicatorX = center.dx + (radius - 15) * cos(indicatorAngle);
    final indicatorY = center.dy + (radius - 15) * sin(indicatorAngle);

    canvas.drawCircle(
      Offset(indicatorX, indicatorY),
      12,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(MoodWheelPainter oldDelegate) {
    return oldDelegate.angle != angle;
  }
}
