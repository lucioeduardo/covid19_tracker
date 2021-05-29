class InfoModel {
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int todayRecovered;
  int recovered;
  int critical;
  int affectedCountries;
  int population;
  int tests;
  String country;
  String flagPath;

  InfoModel.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    todayCases = json['todayCases'];
    population = json['population'];
    tests = json['tests'];
    todayRecovered = json['todayRecovered'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    critical = json['critical'];
    affectedCountries = json['affectedCountries'];
    country = json['country'];
    flagPath = json['countryInfo']['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['critical'] = this.critical;
    data['affectedCountries'] = this.affectedCountries;
    return data;
  }
}