import 'package:flutter/material.dart';

class Vaccines extends StatefulWidget {
  const Vaccines({Key? key}) : super(key: key);

  @override
  _VaccinesState createState() => _VaccinesState();
}

class _VaccinesState extends State<Vaccines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vaccines"),
      ),
    );
  }
}
