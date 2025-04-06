import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_groceries_app/components/custom_elevated_button.dart';
import 'package:nectar_groceries_app/components/custom_text_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                child: SvgPicture.asset(
                  "assets/icons/colored_carott_icon.svg",
                  width: 47.84,
                  height: 55.64,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Loging",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Enter your emails and password",
                      style: TextStyle(fontSize: 16, color: Color(0xff7C7C7C)),
                    ),
                    const SizedBox(height: 40),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: "Email",
                      hintText: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!value.contains(
                          RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ),
                        )) {
                          return "Please enter right email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: "Password",
                      hintText: "Password",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password ?",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 23, bottom: 25),
                      child: CustomElevatedButton(
                        width: 367,
                        height: 67,
                        text: "Log In",
                        color: Color(0xff53B175),
                        handleOnPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                             Navigator.pushNamed(context, "/signup");
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff53B175),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
