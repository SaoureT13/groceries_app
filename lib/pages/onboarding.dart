import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/onboarding_image.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SvgPicture.asset("assets/icons/carotte.svg"),
                    const SizedBox(height: 35.66),
                    Text(
                      "Welcome\n to our Store",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.2
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Ger your groceries in as fast as one hour",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40.88),
                    SizedBox(
                      height: 67,
                      width: 353,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/signin");
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xff53B175),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 90.87),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
