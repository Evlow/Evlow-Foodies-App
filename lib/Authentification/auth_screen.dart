import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
final _formKey = GlobalKey<FormState>();
String error ='';
bool loading = false;

final emailController = TextEditingController();
final passwordController = TextEditingController();
bool ShowSignIn = true;


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}