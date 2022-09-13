import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:covid19/models/global.stats.dart';

Future<IndianGenericData?> getIndiaGlobalStats() async {
  try {
    var response = await http.get(Uri.parse(
        "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return IndianGenericData(
        activeCases: jsonData["activeCases"] ?? 0,
        activeCasesNew: jsonData["activeCasesNew"] ?? 0,
        recovered: jsonData["recovered"] ?? 0,
        recoveredNew: jsonData["recoveredNew"] ?? 0,
        deaths: jsonData["deaths"] ?? 0,
        deathsNew: jsonData["deathsNew"] ?? 0,
        previousDayTests: jsonData["previousDayTests"] ?? 0,
        totalCases: jsonData["totalCases"] ?? 0,
        sourceUrl: jsonData["sourceUrl"] ?? "Source URL not available",
        lastUpdatedAtApify:
            jsonData["lastUpdatedAtApify"] ?? "last updated timestamp",
      );
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
