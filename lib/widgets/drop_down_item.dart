import 'package:flutter/material.dart';

class DropdownItem extends StatelessWidget {
  const DropdownItem({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black87,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
