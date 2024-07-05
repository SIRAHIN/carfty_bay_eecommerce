import 'package:flutter/material.dart';


class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      child: IconButton(
        alignment: Alignment.center,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.black87,
        ),
      ),
    );
  }
}