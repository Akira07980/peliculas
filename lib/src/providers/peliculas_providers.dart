import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = 'dddc34a19d324796847e85121fbf6d27';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
// El  URI https es así = Uri.https(authority, unencodedPath)
//El autority es la URL donde sacaré la Info (Ver _url arriba)
//EL uncoding es el pad sin los argumentos incluida la versión

    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);
    final decodedData =
        json.decode(resp.body); // -> el resp.body trae la lista de peliculas

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    print('AAAAAAAAAAAAAAAAAAAAAAAAA');
    print(peliculas.items[0].title);

    return peliculas.items;
  }
}
