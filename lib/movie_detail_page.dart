import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget{
  final String title;
  final String image;
  final String description;
  final String rating;

  const MovieDetailPage({super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(tag: Text(title,
                style: const TextStyle(
                    color: Colors.white
                ),),
                child: Image.network(
                  image,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(description,
                      style: const TextStyle(fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Rating',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),),
                    ),
                    Text(rating,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}