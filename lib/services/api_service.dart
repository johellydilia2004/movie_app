import 'package:http/http.dart' as http;

import 'package:movie_app/models/movie.dart';

class PeliculaProvider {

  Future<List<Pelicula>> getPelicula() async {
    final url = Uri.parse('https://potterapi-fedeperin.vercel.app/en/characters');
    
    try {
      final response = await http.get(url);
      final data = peliculaFromJson(response.body);
      return data;


    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
  