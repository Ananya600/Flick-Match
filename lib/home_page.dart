// ignore_for_file: avoid_print

import 'package:flick_match/api/api.dart';
import 'package:flick_match/models/movie.dart';
import 'package:flick_match/movie_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Movie> movies=[];

  @override
  void initState(){
    super.initState();
    fetchMovies();
  }
  Future<void> fetchMovies() async {
    try {
      final List<Movie> fetchedMovies = await 

      MovieService.fetchMovies();
      setState(() {
        movies = fetchedMovies ;
      });
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return MovieListView(movies: movies,);

  }}