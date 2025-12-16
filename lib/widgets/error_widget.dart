import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final Object? error;
  const AppErrorWidget({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          error.toString(),
          style: const TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
