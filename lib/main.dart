import 'package:evlow_foodies/authentification/register_screen.dart';
import 'package:evlow_foodies/colors/colors.dart';
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
    return   MaterialApp(
      title: 'Evlow',
      debugShowCheckedModeBanner: false,
      home: const HomeContent(),
      theme:ThemeData(
                fontFamily: 'AdventPro'
      )
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SaltPage(),
    const SweetPage(),
    const PtitsGonesPage(),
    const SpecificPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  //     floatingActionButton: FloatingActionButton(
  //       onPressed:(){},
  //         child: const Icon(Icons.add),

  // foregroundColor: greenColor,
  // elevation: 0,
  // backgroundColor: Colors.white,


  //     ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: SvgPicture.asset(
                      'images/profil.svg',
                      height: 45.0,
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
        selectedItemColor: orangeColor,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
      ),
    );
  }
}
