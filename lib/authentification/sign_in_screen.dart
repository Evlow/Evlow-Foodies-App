import 'package:evlow_foodies/Authentification/auth_service.dart';
import 'package:evlow_foodies/main.dart';
import 'package:flutter/material.dart';
import 'package:evlow_foodies/shared/loading.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({Key? key})
      : super(key: key); // Constructeur de la classe RegisterScreen

  @override
  State<SingInScreen> createState() =>
      _SingInScreenState(); // Crée l'état de RegisterScreen
}

class _SingInScreenState extends State<SingInScreen> {
  final AuthService _auth =
      AuthService(); // Instance de la classe AuthService pour gérer l'authentification
  final _formKey = GlobalKey<
      FormState>(); // Clé globale pour identifier le formulaire et effectuer des validations
  String error = ''; // Variable pour stocker les messages d'erreur
  bool loading = false; // Indicateur pour afficher l'état de chargement

  final emailController =
      TextEditingController(); // Contrôleur pour gérer la valeur du champ email
  final passwordController =
      TextEditingController(); // Contrôleur pour gérer la valeur du champ mot de passe

  @override
  void dispose() {
    emailController.dispose(); // Libère les ressources du contrôleur d'email
    passwordController
        .dispose(); // Libère les ressources du contrôleur de mot de passe
    super.dispose(); // Appelle la méthode dispose de la classe mère
  }


  void signIn() async {
  setState(() {
    loading = true;
  });

  try {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Appel à la méthode signInWithEmailAndPassword de l'instance _auth pour tenter la connexion
    dynamic result = await _auth.signInWithEmailAndPassword(email, password);

    if (result != null) {
      // Navigation vers l'écran suivant (HomeScreen dans cet exemple)
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeContent()),
      );
    } else {
      // En cas d'échec de la connexion
      setState(() {
        loading = false;
        error = 'Erreur de connexion. Vérifiez vos identifiants.';
      });
    }
  } catch (e) {
    setState(() {
      loading = false;
      error = 'Une erreur est survenue lors de la connexion.';
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading() 
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 80.0,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/logo.png', 
                  height: 40.0,
                  fit: BoxFit.contain,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back), 
                onPressed: () {
                  Navigator.pop(
                      context);
                },
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 12, 12, 12)
                            .withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 0,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                      "Envie de partager vos recettes ?\nDe retrouver vos recettes coup de coeur ?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20.0),
                  const Text("Connectez-vous dès à présent !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 235, 87, 87),
                      )),
                  const SizedBox(height: 20.0),
                  Form(
                    key:
                        _formKey, // Lie ce formulaire à la clé globale _formKey
                    child: Column(
                      children: [
                        TextFormField(
                          controller:
                              emailController, // Utilise le contrôleur emailController pour gérer le champ
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 235, 87, 87),
                            )),
                            labelText:
                                'Email', // Texte à afficher dans le champ
                          ),
                          validator: (value) => value!.isEmpty
                              ? "Entrer un email"
                              : null, // Validation du champ email
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller:
                              passwordController, // Utilise le contrôleur passwordController pour gérer le champ
                          obscureText:
                              true, // Masque le texte saisi pour le champ mot de passe
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 235, 87, 87),
                            )),
                            labelText:
                                'Mot de passe', // Texte à afficher dans le champ
                          ),
                          validator: (value) => value!.length < 6
                              ? "Entrer un mot de passe d'au moins 6 caractères"
                              : null, // Validation du champ mot de passe
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Vérifie si le formulaire est valide avant de déclencher l'authentification
                              signIn(); // Appelle la méthode signIn pour tenter de se connecter
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 55, 121, 66),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                              'Je me connecte'), // Texte du bouton de connexion
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          error, // Affiche le message d'erreur en cas d'échec de connexion
                          style: const TextStyle(
                              color: Colors.red, fontSize: 14.0),
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
