import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon.dart';

class ApiService {
  static Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=50'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['results'];
      List<Pokemon> pokemons = [];
      for (var pokemon in jsonData) {
        final detailsResponse = await http.get(Uri.parse(pokemon['url']));
        if (detailsResponse.statusCode == 200) {
          final detailsJson = json.decode(detailsResponse.body);
          pokemons.add(Pokemon.fromJson(detailsJson));
        }
      }
      return pokemons;
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}
