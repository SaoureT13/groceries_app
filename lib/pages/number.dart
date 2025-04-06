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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, "/verification");
          // if(mobileNumberController.text.length == 0){

          // }
          if (phoneNumber != null && phoneNumber!.number.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Phone Number: ${phoneNumber!.completeNumber}"),
              ),
            );
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
