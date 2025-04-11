import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    // Forcer les icônes en blanc (si l'image est foncée)
    

    return Scaffold(
      extendBodyBehindAppBar:
          true, // Permet à l'image de passer sous la status bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          }, // action retour
        ),
      ),
      body: Stack(
        children: [
          // Image de fond
          // Container(
          //   height: 300,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(
          //         "assets/images/onboarding_image.png",
          //       ), // remplace par ton image
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Container(
            width: double.infinity,
            height: 331.44,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/red_apple_image.png"),
              ),
            ),

            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: const Color(0xffF2F3F2).withOpacity(0.8),
                  height: 120, // Optionnel selon le contexte
                ),
              ),
            ),
          ),

          // Contenu par-dessus
          // Positioned.fill(
          //   top: 250,
          //   child: Container(
          //     padding: const EdgeInsets.all(16),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          //     ),
          //     child: ListView(
          //       children: [
          //         Text(
          //           "Ali Connors",
          //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //         ),
          //         SizedBox(height: 16),
          //         ListTile(
          //           leading: Icon(Icons.phone),
          //           title: Text("(650) 555-1234"),
          //           subtitle: Text("Mobile"),
          //           trailing: Icon(Icons.message),
          //         ),
          //         // Ajoute plus de ListTile ici...
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
