import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// import 'package:intl_phone_field/phone_number.dart';

class CustomIntlPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function? handleOnTap;
  final Function(PhoneNumber)? onChanged;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;

  const CustomIntlPhoneField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.handleOnTap,
    this.onChanged,
    this.validator,
    this.label,
    this.hintText,
  });

  @override
  State<CustomIntlPhoneField> createState() => _CustomIntlPhoneFieldState();
}

class _CustomIntlPhoneFieldState extends State<CustomIntlPhoneField> {
  bool isValid = false;

  String initialCountry = 'NG';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.handleOnTap?.call();
      },
      child: AbsorbPointer(
        absorbing: widget.handleOnTap != null,
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            widget.onChanged?.call(number);
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            useBottomSheetSafeArea: true,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          textFieldController: widget.controller,
          formatInput: true,
          keyboardType: TextInputType.number,
          inputBorder: UnderlineInputBorder(),
          inputDecoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hintText,
            labelStyle: TextStyle(
              color: Color(0xff7C7C7C),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
