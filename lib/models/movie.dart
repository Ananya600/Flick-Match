class Movie{
  String title;
  String overview;
  String id;
  String posterPath;
  String voteAvg;
  String releaseDate;

  Movie({
    required this.title,
    required this.overview,
    required this.id,
    required this.posterPath,
    required this.voteAvg,
    required this.releaseDate,
});
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        title: json['title'],
        overview: json['overview'],
        id: json['id'].toString(),
        posterPath: json['poster_path'],
        voteAvg: json['vote_average'].toString(),
        releaseDate: json['release_date']
    );
  }


}