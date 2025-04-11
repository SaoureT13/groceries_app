import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:nectar_groceries_app/components/custom_filled_button.dart";
import "package:nectar_groceries_app/components/custom_intl_phone_field.dart";

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SignIn();
}

class _SignIn extends State<Signin> {
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //Get your groceries with nectar

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/signin.png"),
          const SizedBox(height: 49.18),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 24.53),
              child: Text(
                "Get your groceries\nwith nectar",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.53),
              child: SizedBox(
                child: CustomIntlPhoneField(
                  controller: mobileNumberController,
                  handleOnTap: () {
                    Navigator.pushNamed(context, "/number");
                  },
                  label: "Mobile Number",
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: Text(
              "Or connect with social media",
              style: TextStyle(color: Color(0xff828282)),
            ),
          ),
          CustomFilledButton(
            color: const Color(0xff5383EC),
            width: 364,
            height: 67,
            text: "Continue with Google",
            icon: "assets/icons/google_icon.svg",
          ),
          const SizedBox(height: 20),
          CustomFilledButton(
            color: const Color(0xff4A66AC),
            width: 364,
            height: 67,
            text: "Continue with Facebook",
            icon: "assets/icons/facebook_icon.svg",
          ),
        ],
      ),
    );
  }
}
