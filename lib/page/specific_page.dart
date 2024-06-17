import 'package:flutter/material.dart';

class SpecificPage extends StatefulWidget {
  const SpecificPage({super.key});

  @override
  State<SpecificPage> createState() => _SpecificPageState();
}

class _SpecificPageState extends State<SpecificPage> {
  @override
  Widget build(BuildContext context) {
        return const Center(
      child : Text("SpecificPage ")
    );
  }
}