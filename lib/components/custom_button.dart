import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.icon,
      this.isOutlined = false,
      this.backgroundColor,
      this.fontWeight = FontWeight.bold});

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isOutlined;
  final FontWeight? fontWeight;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: double
            .infinity, // Ensure the button takes the full width of its parent
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            backgroundColor: isOutlined
                ? Colors.transparent
                : (backgroundColor ?? Colors.black),
            foregroundColor: isOutlined ? Colors.black : Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              side: isOutlined
                  ? BorderSide(color: Colors.black)
                  : BorderSide.none,
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize
                .min, // Adjust the size of the Row to fit its content
            children: [
              if (icon != null) ...[
                Icon(icon),
                SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(fontSize: 14, fontWeight: fontWeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
