import 'package:http/http.dart' as http;

class Api {
  static Future getPokemons() {
    return http.get(
      Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"),
    );
  }
}