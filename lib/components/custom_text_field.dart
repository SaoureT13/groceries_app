import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;

  const CustomTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.maxLength,
    this.textInputType,
    this.textInputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      cursorColor: Color(0xff7C7C7C),
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xff7C7C7C),
          fontWeight: FontWeight.w700,
        ),
        hintText: hintText,
        counterText: "",
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
      ),
    );
  }
}
