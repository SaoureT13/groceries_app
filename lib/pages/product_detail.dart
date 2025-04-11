import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:expandable/expandable.dart';
import 'package:nectar_groceries_app/components/custom_accordion.dart';
import 'package:nectar_groceries_app/components/custom_elevated_button.dart';
import 'package:nectar_groceries_app/extensions/string_extensions.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.productName});

  final String productName;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Android
        statusBarBrightness: Brightness.light, // iOS
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 67, // Prend toute la largeur
          child: CustomElevatedButton(
            width: double.infinity,
            height: 67,
            text: "add to basket".toCapitalize(),
            color: Color(0xff53B175),
            handleOnPressed: () {},
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 372,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F3F2),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 45,
                        right: 0,
                        left: 0,
                        child: ImageFiltered(
                          imageFilter: ui.ImageFilter.blur(
                            sigmaX: 6,
                            sigmaY: 6,
                          ),
                          child: Image.asset(
                            'assets/images/red_apple_image.png',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 55,
                        right: 0,
                        left: 0,
                        child: Image.asset("assets/images/red_apple_image.png"),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: SvgPicture.asset("assets/icons/share_icon.svg"),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productName,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "1kg, price",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff7C7C7C),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/favorite_icon.svg",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: SvgPicture.asset(
                                  "assets/icons/minus_icon.svg",
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE2E2E2),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: SvgPicture.asset(
                                  "assets/icons/plus_icon.svg",
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$4.99",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Divider(color: Color(0xffE2E2E2)),
                      CustomAccordion(
                        headerText: "Product Detail",
                        expandedText:
                            "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                      ),
                      Divider(color: Color(0xffE2E2E2)),
                      CustomAccordion(
                        headerText: "Nutritions",
                        expandedText:
                            "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                        custom: Container(
                          width: 34,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Color(0xffEBEBEB),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "100gr",
                              style: TextStyle(
                                fontSize: 9,
                                color: Color(0xff7C7C7C),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(color: Color(0xffE2E2E2)),
                      CustomAccordion(
                        headerText: "Review",
                        expandedText:
                            "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
