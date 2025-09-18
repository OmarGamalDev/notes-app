import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.height,
    required this.width,
    required this.style,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double height, width;
  final TextStyle style;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Color(0xff6c492d)),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: Size(width, height),
        ),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.black,
              )
            : Text(text, style: style),
      ),
    );
  }
}
