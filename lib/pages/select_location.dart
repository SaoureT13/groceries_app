import 'package:flutter/material.dart';
import 'package:nectar_groceries_app/components/custom_dropdownbuttonformfield.dart';
import 'package:nectar_groceries_app/components/custom_elevated_button.dart';
import 'package:nectar_groceries_app/components/custom_text_form_field.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCity;
  final TextEditingController areaController = TextEditingController();

  @override
  void dispose() {
    areaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Image.asset("assets/images/location_image.png"),
                const SizedBox(height: 40.15),
                Text(
                  "Select your location",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Swithch on your location to stay in tune with\n what’s happening in your area",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xff7C7C7C)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 90),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomDropdownbuttonformfield(
                    labelText: "Your Zone",
                    hintText: "Types of your zone",
                    cities: [
                      'Abidjan',
                      'Bouaké',
                      'Yamoussoukro',
                      'Daloa',
                      'San-Pédro',
                      'Korhogo',
                      'Man',
                      'Gagnoa',
                      'Divo',
                      'Abengourou',
                    ],
                    errorMessage: "Please select your zone",
                    selectedCity: selectedCity,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    controller: areaController,
                    labelText: "Your area",
                    hintText: "Your area",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your area";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.15),
                  CustomElevatedButton(
                    color: const Color(0xff53B175),
                    width: 364,
                    height: 67,
                    text: "Submit",
                    handleOnPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/login");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
