import 'package:evlow_foodies/firebase_options.dart';
import 'package:evlow_foodies/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:evlow_foodies/page/ptits_gones_page.dart';
import 'package:evlow_foodies/page/salt_page.dart';
import 'package:evlow_foodies/page/specific_page.dart';
import 'package:evlow_foodies/page/sweet_page.dart';
import 'package:evlow_foodies/screen/profil_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Evlow',
      debugShowCheckedModeBanner: false,
      home: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SaltPage(),
    SweetPage(),
    PtitsGonesPage(),
    SpecificPage(),
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
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: SvgPicture.asset(
                      'images/profil.svg',
                      height: 40.0,
                    ),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Salées',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Sucrées',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            label: "P'tits Gônes",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.leaf),
            label: 'Spécifiques',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 235, 87, 87),
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}
