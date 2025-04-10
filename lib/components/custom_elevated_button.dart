import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final String? icon;
  final Color color;
  final VoidCallback handleOnPressed;

  const CustomElevatedButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    this.icon,
    required this.color,
    required this.handleOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: handleOnPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            if (icon != null)
              ...[
              SvgPicture.asset(icon!, height: 24, width: 24), // Icône à gauche
            ],
           Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center, // Centre le texte
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
