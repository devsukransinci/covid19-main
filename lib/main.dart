import 'package:covid19/views/home.view.dart';
import 'package:flutter/material.dart';


import 'package:covid19/library/views.lib.dart';

import 'nav/navdrawer.component.dart';

// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const Covid19());
}

class Covid19 extends StatelessWidget {
  const Covid19({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.redAccent,
          iconTheme: IconThemeData(
            color: Colors.greenAccent,
            size: 30,
          ),
          titleTextStyle: TextStyle(fontSize: 20),
          centerTitle: true,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Covid 19"),
        ),
        drawer: const NavDrawerWidget(),
        body: const HomePageBody(),
        // body: Country(),
      ),
    );
  }
}
