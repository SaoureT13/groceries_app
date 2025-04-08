import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final String? Function(String?)? validator;
  // final bool? isPasswordField;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.maxLength,
    this.textInputType,
    this.textInputFormatter,
    this.validator,
    // this.isPasswordField,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscured = false;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText; // Initialize the obscureText state
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      maxLength: widget.maxLength,
      style: TextStyle(fontSize: 18),
      cursorColor: const Color(0xff7C7C7C),
      keyboardType: widget.textInputType,
      obscureText: isObscured,
      inputFormatters: widget.textInputFormatter,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Color(0xff7C7C7C),
          fontWeight: FontWeight.w700,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xffB1B1B1)),
        counterText: "",
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured; // Toggle obscureText
                    });
                  },
                )
                : null,
      ),
    );
  }
}
