import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.radius,
    required this.validat,
  });

  final String hint;
  final double radius;
  final String? Function(String?)? validat;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validat,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(
              radius,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              radius,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(
              radius,
            ),
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
