import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: Row(
            children: [
              Text("Qu’est-ce qu’on mange ?",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
              "Avec Evlow Foodies, vous trouverez des recettes, pour tous les goûts et faciles à réaliser !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: Text("Découvrez les dernières idées de recettes :",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
