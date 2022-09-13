import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../services/api.service.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final List<String> _countries = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
  ];
  final List<String> _status = [
    "confirmed",
    "deaths",
  ];
  bool isFormVisible = true;
  var paddingVertical20 = const EdgeInsets.symmetric(vertical: 30);
  var paddingHorizontal30 = const EdgeInsets.symmetric(horizontal: 30);

  String _selectedCountry = "";
  String _selectedStatus = "";

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: paddingHorizontal30,
            child: Visibility(
              visible: isFormVisible,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: paddingVertical20,
                      child: DropdownSearch(
                        mode: Mode.BOTTOM_SHEET,
                        items: _countries,
                        label: "Country",
                        onChanged: print,
                        validator: (value) =>
                            value == null ? 'Please select country' : null,
                        onSaved: (value) =>
                            setState(() => _selectedCountry = value as String),
                      ),
                    ),
                    // Padding(
                    //   padding: paddingVertical20,
                    //   child: DropdownSearch(
                    //     mode: Mode.BOTTOM_SHEET,
                    //     items: _status,
                    //     label: "Status",
                    //     onChanged: print,
                    //     validator: (value) =>
                    //         value == null ? 'Please select status' : null,
                    //     onSaved: (value) =>
                    //         setState(() => _selectedStatus = value as String),
                    //   ),
                    // ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          _formKey.currentState?.save();
                        }
                      },
                      icon: const Icon(Icons.gesture_outlined),
                      label: const Text(
                        'Fetch data',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Visibility(
                visible: !isFormVisible,
                child: Container(
                  height: 500,
                  width: 500,
                  color: Colors.green,
                )
                //  ElevatedButton(
                //   onPressed: () => print("cddcs"),
                //   child: const Text("data"),
                // ),
                ),
          )
        ],
      ),
    );
  }
}
