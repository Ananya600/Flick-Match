
import 'dart:convert';
import 'package:flick_match/models/movie.dart';
import 'package:http/http.dart' as http;

import 'package:flick_match/api/constants.dart';

class MovieService {
  static Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(
      '${ApiKey.baseUrl}/movie/popular?api_key=${ApiKey.apiKey}',
    ));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

}