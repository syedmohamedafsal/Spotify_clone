import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hinttxt;
  final Color? backgroundColor;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final Color? textColor; // Add a text color property

  CustomTextField({
    super.key,
    this.hinttxt,
    this.backgroundColor,
    this.suffixIcon,
    this.controller,
    this.textColor, // Default text color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(10), // Padding on all sides
        decoration: BoxDecoration(
          color: backgroundColor, // Background color
          borderRadius: BorderRadius.circular(
            10,
          ), // Border radius
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(color: textColor), // Set the text color
          decoration: InputDecoration(
            hintText: hinttxt,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none, // Remove default border
            contentPadding: const EdgeInsets.all(5), // Inner padding
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
