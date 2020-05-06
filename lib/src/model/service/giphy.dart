import 'dart:convert';
import 'package:gif_searcher/src/model/dto/gif.dart';
import 'package:http/http.dart' as http;

class Giphy {
  static String apiUrl = 'https://api.giphy.com/v1/gifs/';
  final String key;

  Giphy(this.key);

  Future<Map> search(String keyword, int offset) async {
    http.Response response = await http.get("${apiUrl}search?api_key=${this.key}&q=$keyword&limit=19&offset=$offset");

    Map<String, dynamic> parsedReponse = json.decode(response.body);

    return parsedReponse;
  }

  Future<Map> getFeatured() async {
    http.Response response = await http.get("${apiUrl}trending?api_key=${this.key}&limit=20&rating=G");

    Map<String, dynamic> parsedReponse = json.decode(response.body);

    return parsedReponse;
  }

  List<GifDTO> unserializeData(Map<String, dynamic> serializedData) {
    List<dynamic>  data = serializedData['data'];

    return data.map((item) => GifDTO(id: item['id'], slug: item['slug'], url: item['images']['fixed_height']['url'])).toList();
  }
}
