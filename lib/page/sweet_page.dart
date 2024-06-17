import 'package:flutter/material.dart';

class SweetPage extends StatefulWidget {
  const SweetPage({super.key});

  @override
  State<SweetPage> createState() => _SweetPageState();
}

class _SweetPageState extends State<SweetPage> {
  @override
  Widget build(BuildContext context) {
        return const Center(
      child : Text("SweetPage 2")
    );
  }
}