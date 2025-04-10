import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditing;
  final Function(String) onChanged;
  final Function() onClear;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.isEditing = false,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF2F3F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        onChanged: (value) {
          onChanged.call(value);
        },
        controller: controller,
        autofocus: false,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        cursorColor: Color(0xff7C7C7C),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: "Search Store",
          hintStyle: TextStyle(
            color: Color(0xff7C7C7C),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.all(16),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              "assets/icons/search_icon.svg",
              width: 20,
              height: 20,
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
          suffixIcon:
              isEditing
                  ? IconButton(
                    onPressed: () {
                      onClear.call();
                    },
                    icon: SvgPicture.asset("assets/icons/close_icon.svg"),
                  )
                  : null,
          suffixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
        ),
      ),
    );
  }
}
