import 'package:evlow_foodies/colors/colors.dart';
import 'package:evlow_foodies/page/account_page.dart';
import 'package:evlow_foodies/page/add_recipes_page.dart';
import 'package:evlow_foodies/page/favoris_page.dart';
import 'package:evlow_foodies/page/recipes_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePageProfilContent extends StatefulWidget {
  const HomePageProfilContent({super.key});

  @override
  State<HomePageProfilContent> createState() => _HomePageProfilContentState();
}

class _HomePageProfilContentState extends State<HomePageProfilContent> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePageProfilContent(),
    const RecipesPage(),
    const AccountPage(),
    const AddRecipes(),
    const FavorisPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'images/logo.png',
                  height: 40.0,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 12, 12, 12).withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 0,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Recettes',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            label: 'Compte',
          ),
           BottomNavigationBarItem(
            icon: Icon(MdiIcons.heartOutline),
            label: 'Favoris',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: orangeColor,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
    );
  }
}
