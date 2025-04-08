import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nectar_groceries_app/components/custom_intl_phone_field.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  final TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPhoneValid = false;
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
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
                Form(
                  key: _formKey,
                  child: SizedBox(
                    child: CustomIntlPhoneField(
                      controller: mobileNumberController,
                      validator: (phone) {
                        if (phone == null || phone.isEmpty) {
                          return "Please enter your phone number";
                        }
                        return null;
                      },
                      onChanged: (phone) {
                        setState(() {
                          number = phone;
                        });
                      },
                      label: "Mobile Number",
                    ),
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
