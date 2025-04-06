import 'package:flutter/material.dart';

class CustomDropdownbuttonformfield extends StatefulWidget {
  final List<String> cities;
  final String? labelText;
  final String? hintText;
  final String? selectedCity;
  final String errorMessage;

  const CustomDropdownbuttonformfield({
    super.key,
    required this.cities,
    this.labelText,
    this.hintText,
    this.selectedCity,
    required this.errorMessage,
  });

  @override
  State<CustomDropdownbuttonformfield> createState() =>
      _CustomDropdownbuttonformfieldState();
}

class _CustomDropdownbuttonformfieldState
    extends State<CustomDropdownbuttonformfield> {
  String? _selectedCity;

  @override
  void initState() {
    super.initState();
    _selectedCity = widget.selectedCity;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xff7C7C7C),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 18, color: Color(0xffB1B1B1)),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
      ),
      value: _selectedCity,
      items:
          widget.cities.map((city) {
            return DropdownMenuItem(value: city, child: Text(city));
          }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCity = value;
        });
      },
    );
  }
}
