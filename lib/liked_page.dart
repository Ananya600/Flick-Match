import 'package:flick_match/movie_detail_page.dart';
import 'package:flutter/material.dart';

class LikedPage extends StatelessWidget{
  final List<Map<String,String>>likedMovies;

  const LikedPage({super.key, required this.likedMovies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Text('Liked Movies',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: likedMovies.isEmpty?
        const Center(
            child: Text('No Movies liked yet!',
              style: TextStyle(
                color: Colors.white,
              ),
            )
        ):ListView.builder(
            itemCount: likedMovies.length,
            itemBuilder:(context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=> MovieDetailPage(
                              title: likedMovies[index]['title']!,
                              image: likedMovies[index]['image']!,
                              description: likedMovies[index]['description']!,
                              rating: likedMovies[index]['rating']!
                    )
                      ),
                  );
                },
                child: Card(
                  color: Colors.black,
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.network(
                        likedMovies[index]['image']!,
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Expanded(child: Padding(padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              likedMovies[index]['title']!,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.black,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              likedMovies[index]['description']!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  backgroundColor: Colors.black,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            }

        ));
  }
  }
