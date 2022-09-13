import 'package:flutter/material.dart';

import 'package:covid19/services/constants.dart';

import '../services/drawer.widget.service.dart';

class NavDrawerWidget extends StatelessWidget {
  const NavDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 27, 29, 145),
        child: ListView(
          children: <Widget>[
            buildDrawerBanner(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  buildDrawerMenuItem(
                    menutext: 'Country',
                    menuicon: Icons.public,
                    onItemTaped: () => selectedItemOnNav(context,
                        toPage: Covid19Pages.country),
                  ),
                  const SizedBox(height: 16),
                  buildDrawerMenuItem(
                    menutext: 'History',
                    menuicon: Icons.timeline,
                    onItemTaped: () => selectedItemOnNav(context,
                        toPage: Covid19Pages.history),
                  ),
                  const SizedBox(height: 16),
                  buildDrawerMenuItem(
                    menutext: 'Vaccines',
                    menuicon: Icons.healing_outlined,
                    onItemTaped: () => selectedItemOnNav(context,
                        toPage: Covid19Pages.vaccines),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
