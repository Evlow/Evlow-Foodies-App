import 'package:evlow_foodies/colors/colors.dart';
import 'package:evlow_foodies/page/add_recipes_page.dart';
import 'package:flutter/material.dart';

class HomePageProfilContent extends StatefulWidget {
  const HomePageProfilContent({super.key});

  @override
  State<HomePageProfilContent> createState() => _HomePageProfilContentState();
}

class _HomePageProfilContentState extends State<HomePageProfilContent> {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Bienvenue sur votre compte",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: orangeColor,
                ),
              ),
            ),
            Image.asset(
              'images/book.png',
              height: 150.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Vous n’avez pas encore publié de recettes. \n Publiez votre première recette !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
                 ElevatedButton(
                          onPressed: () {
                             {
                           const   AddRecipes();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: greenColor,
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side : BorderSide(color: greenColor)
                            
                            ),
                          ),
                          child: const Text(
                            'Ajouter une recette',
                          ),
                        ),
          ],
        ),
      );
}
