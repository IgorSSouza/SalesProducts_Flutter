import 'package:flutter/material.dart';

class BadgeCount extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;

  const BadgeCount(
      {super.key, required this.child, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: Text(
                value,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ))
      ],
    );
  }
}
