import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool textShadow;

  const new({
    required this.hintText,
    required this.prefixIcon,
    super.key,
    this.obscureText = false,
    this.suffixIcon,
    this.textShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          height: 1,
          letterSpacing: 0,
          color: const Color.fromRGBO(0, 0, 0, 0.30),
          shadows: textShadow
              ? const [
                  Shadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ]
              : null,
        ),
        prefixIcon: Icon(prefixIcon, color: const Color(0xFF471AA0)),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF9747FF), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF9747FF), width: 2),
        ),
      ),
    );
  }
}
