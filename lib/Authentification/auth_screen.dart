import 'package:flutter/material.dart';
import 'package:evlow_foodies/shared/loading.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    // Ajoutez votre logique de connexion ici
    setState(() {
      loading = true; // Activez l'écran de chargement
    });

    // Simulation d'une attente pour la démonstration
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      loading = false; // Désactivez l'écran de chargement
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading() // Si loading est vrai, affiche l'écran de chargement
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
                  Navigator.pop(context);
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
                  const Text(  "Envie de partager vos recettes ?\nDe retrouver vos recettes coup de coeur ?"),
                  const SizedBox(height: 20.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Entrer un email" : null,
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Mot de passe',
                          ),
                          validator: (value) =>
                              value!.length < 6 ? "Entrer un mot de passe" : null,
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: signIn,
                          child: const Text('Sign In'),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          error,
                          style: const TextStyle(color: Colors.red, fontSize: 14.0),
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
