class IndianGenericData {
  final int activeCases,
      activeCasesNew,
      recovered,
      recoveredNew,
      deaths,
      deathsNew,
      previousDayTests,
      totalCases;
  final String sourceUrl, lastUpdatedAtApify;

  IndianGenericData({
    required this.activeCases,
    required this.activeCasesNew,
    required this.recovered,
    required this.recoveredNew,
    required this.deaths,
    required this.deathsNew,
    required this.previousDayTests,
    required this.totalCases,
    required this.sourceUrl,
    required this.lastUpdatedAtApify,
  });
}

class VaccineGlobalData {
  final int population,
      administered,
      peopleVaccinated,
      peoplePartiallyVaccinated;

  VaccineGlobalData(this.population, this.administered, this.peopleVaccinated,
      this.peoplePartiallyVaccinated);
}

class CountryGlobalData {
  final int population, confirmed, recovered, deaths;

  CountryGlobalData(
      this.population, this.confirmed, this.recovered, this.deaths);
}
