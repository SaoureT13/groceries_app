import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_groceries_app/components/custom_text_field.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Resend code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff53B175),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/select_location");
              },
              backgroundColor: Color(0xff53B175),
              child: SvgPicture.asset("assets/icons/arrow_right_icon.svg"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                "Enter your 4-digit code",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              child: CustomTextField(
                controller: codeController,
                labelText: "Code",
                hintText: "- - - -",
                maxLength: 4,
                textInputType: TextInputType.number,
                textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
