import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/phone_number.dart';
import "package:nectar_groceries_app/components/custom_intl_phone_field.dart";

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  final TextEditingController mobileNumberController = TextEditingController();
  PhoneNumber? phoneNumber;
  bool isPhoneValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (phoneNumber != null && phoneNumber!.number.isNotEmpty) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text("Phone Number: ${phoneNumber!.completeNumber}"),
            //   ),
            // );
            Navigator.pushNamed(context, "/verification");
          }
        },
        backgroundColor: Color(0xff53B175),
        child: SvgPicture.asset("assets/icons/arrow_right_icon.svg"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your mobile number",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            Column(
              children: [
                SizedBox(
                  child: CustomIntlPhoneField(
                    controller: mobileNumberController,
                    onChanged: (phone) {
                      setState(() {
                        phoneNumber = phone;
                      });
                    },
                    validator: (phone) {
                      if (phone == null || phone.number.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (phone.number.length < 8) {
                        return 'Phone number must be at least 8 digits';
                      }
                      setState(() {
                        isPhoneValid = true; // Update validation state
                      });
                      return null; // Valid phone number
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
