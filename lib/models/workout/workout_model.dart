import 'package:flutter/material.dart';

class Workout {
  final String id;
  final String name;
  final String tag;
  final String duration;
  final Color color;
  final Color bgColor;
  final IconData icon;

  Workout({
    required this.id,
    required this.name,
    required this.tag,
    required this.duration,
    required this.color,
    required this.bgColor,
    required this.icon,
  });
}
