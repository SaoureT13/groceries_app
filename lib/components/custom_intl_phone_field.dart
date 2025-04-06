import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
// import 'package:intl_phone_field/phone_number.dart';

class CustomIntlPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function? handleOnTap;
  final Function(PhoneNumber)? onChanged;
  final String? Function(PhoneNumber?)? validator;
  // Removed the mutable 'number' field to comply with immutability.

  const CustomIntlPhoneField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.handleOnTap,
    this.onChanged,
    this.validator
  });

  @override
  State<CustomIntlPhoneField> createState() => _CustomIntlPhoneFieldState();
}

class _CustomIntlPhoneFieldState extends State<CustomIntlPhoneField> {
  bool isValid = false; 
  
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: widget.controller,
      cursorColor: const Color(0xff7C7C7C),
      decoration: const InputDecoration(
        labelText: 'Mobile Number',
        labelStyle: TextStyle(
          color: Color(0xff7C7C7C),
          fontWeight: FontWeight.bold,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
        counterText: "",
      ),
      initialCountryCode: 'CI',
      onChanged: (phone){
        widget.onChanged?.call(phone);
      },
      onTap: () => widget.handleOnTap?.call(),
      validator: (phone) {
        final validationResult = widget.validator?.call(phone);
        setState(() {
          isValid = validationResult == null; // Update isValid based on validation
        });
        return validationResult;
      },
    );
  }
}
