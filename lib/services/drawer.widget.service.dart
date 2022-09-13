import 'package:covid19/models/global.stats.dart';
import 'package:covid19/services/constants.dart';
import 'package:covid19/views/country.view.dart';
import 'package:covid19/views/history.view.dart';
import 'package:covid19/views/vaccines.view.dart';
import 'package:flutter/material.dart';

import '../library/views.lib.dart';

/// Widgets for navdrawer.dart
///
/// * This Widget builds the banner in the Drawer with the given image URL from internet.

Widget buildDrawerBanner() {
  return Container(
    // color: Colors.red,
    padding: const EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: const NetworkImage(
            "https://www.paho.org/sites/default/files/styles/flexslider_full/public/2020-03/blue-covid-banner.jpg?h=96546727&itok=xDLAoRJF",
          ),
          height: 200,
        ),
        const Text(
          "Covid 19",
          style: TextStyle(
            color: Colors.red,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

/// * This Widget builds the elements in the drawer with,
///
/// > `menutext` : The text that is to be displayed in the drawer
///
/// > `menuicon` : The IconData that is to be displayed. For Example: Icons.public
///
/// > `onItemTaped` : Calls selectedItemOnNav( `BuildContext` , `Enum` )
Widget buildDrawerMenuItem({
  required String menutext,
  required IconData menuicon,
  required VoidCallback onItemTaped,
}) {
  const color = Colors.white;
  const menuHoverColor = Colors.white70;
  return ListTile(
    leading: Icon(
      menuicon,
      color: color,
    ),
    title: Text(
      menutext,
      style: const TextStyle(
        color: color,
        fontSize: 20,
      ),
    ),
    hoverColor: menuHoverColor,
    onTap: onItemTaped,
  );
}

/// Widgets for navdrawer.dart
/// * This function navigates to the selected page,

void selectedItemOnNav(BuildContext context, {required Covid19Pages toPage}) {
  Navigator.of(context).pop();
  switch (toPage) {
    case Covid19Pages.country:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Country(),
      ));
      break;
    case Covid19Pages.history:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const History(),
      ));
      break;
    case Covid19Pages.vaccines:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Vaccines(),
      ));
      break;
    default:
  }
}
//==================================================================================================================================//

/// Widegts for home.dart
///
/// This widget builds a tile, which is a part of the wheen in Home Page
///

Widget homePageDataCard(
    {required IndianGenericData? dataObjectToDiaplay, required int index}) {
  final String statDataToDisplay;
  String attributeToDisplay = indianGenericDataMap.values.elementAt(index);
  switch (index) {
    case 0:
      statDataToDisplay = dataObjectToDiaplay!.activeCases.toString();
      break;
    case 1:
      statDataToDisplay = dataObjectToDiaplay!.activeCasesNew.toString();
      break;
    case 2:
      statDataToDisplay = dataObjectToDiaplay!.recovered.toString();
      break;
    case 3:
      statDataToDisplay = dataObjectToDiaplay!.recoveredNew.toString();
      break;
    case 4:
      statDataToDisplay = dataObjectToDiaplay!.deaths.toString();
      break;
    case 5:
      statDataToDisplay = dataObjectToDiaplay!.deathsNew.toString();
      break;
    case 6:
      statDataToDisplay = dataObjectToDiaplay!.previousDayTests.toString();
      break;
    case 7:
      statDataToDisplay = dataObjectToDiaplay!.totalCases.toString();
      break;
    case 8:
      statDataToDisplay = dataObjectToDiaplay!.sourceUrl.toString();
      break;
    case 9:
      statDataToDisplay = dataObjectToDiaplay!.lastUpdatedAtApify.toString();
      break;
    default:
      statDataToDisplay = "";
  }

  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: Colors.blue,
    ),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(20),
    height: 300,
    width: 300,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            statDataToDisplay,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            attributeToDisplay,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
