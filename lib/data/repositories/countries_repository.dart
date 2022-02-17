import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:world_population/domain/entities/country_info.dart';

const Map<String, String> headers = {
  'x-rapidapi-host': 'world-population.p.rapidapi.com',
  'x-rapidapi-key': 'e7b3a861b6msh088c4d903d2e615p163ae3jsnbfbf35ef74f8'
};

class CountriesRepository {
  Future<List<String>?> getCountries() async {
    try {
      var url =
          Uri.parse('https://world-population.p.rapidapi.com/allcountriesname');
      Response response = await http.get(url, headers: headers);
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      return List<String>.from(result["body"]["countries"]);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CountryInfo?> getSingleCountry(String country) async {
    try {
      var url = Uri.parse(
          'https://world-population.p.rapidapi.com/population?country_name=$country');
      Response response = await http.get(url, headers: headers);
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      return CountryInfoDTO.fromJson(result["body"]).toCountryInfo();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
