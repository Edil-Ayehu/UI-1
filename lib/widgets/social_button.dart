import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  const SocialButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Image.asset(
        imagePath,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      ),
    );
  }
}
