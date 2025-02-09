import 'package:flick_match/api/constants.dart';
import 'package:flick_match/liked_page.dart';
import 'package:flutter/material.dart';
import 'models/movie.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

class MovieListView extends StatefulWidget {
  final List<Movie> movies;

  const MovieListView({super.key, required this.movies});

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final List<Map<String, String>> likedMovies = [];
  late final List<Movie> movies;

  void _navigateToLikedPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LikedPage(likedMovies: likedMovies),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // A deep, rich color
        title: const Text("Movie Swipe", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: _navigateToLikedPage,
            icon: const Icon(Icons.favorite_border, size: 30), // Larger heart icon
          ),
        ],
      ),
      body: Container(
        child: widget.movies.isEmpty
        ?const Center(
          child: CircularProgressIndicator(),
        ):
        AppinioSwiper(
            backgroundCardCount: 0,
            cardCount: widget.movies.length,
            cardBuilder: (BuildContext context, int index) {
              return MovieCard(movie: widget.movies[index]);
            },
            onSwipeEnd: (int previousIndex, int targetIndex, SwiperActivity activity) {
              if ('${activity.direction}'=='AxisDirection.right') {
                likedMovies.add({
                  'title': widget.movies[previousIndex].title,
                  'image': "https://image.tmdb.org/t/p/w500${widget.movies[previousIndex].posterPath}",
                  'description': widget.movies[previousIndex].overview,
                  'rating':widget.movies[previousIndex].voteAvg
                });
              }
            },
          ),
      ),
      );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10, // Adds shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15), // Ensures the card is rounded
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                '${ApiKey.imageBaseUrl}${movie.posterPath}',
                fit: BoxFit.cover, // Ensures the image covers the card
              ),
              // Adding an overlay to enhance the readability of text
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              // Movie details on top of the background image
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(color: Colors.black.withOpacity(0.5), offset: const Offset(2, 2), blurRadius: 5)
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movie.overview,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis, // Ensures long text doesn't overflow
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
