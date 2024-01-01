import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/movie_model/MovieModel.dart';

import '../screens/home_screen/detail_screen.dart';

class MovieInfoCard extends StatelessWidget {
  const MovieInfoCard({
    Key? key,
    required this.movie,
    // required this.onTap,
  }) : super(key: key);

  final MovieDataModel movie;
  // final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(movie: movie,),
              ),
            );
          },
          child: Card(
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  imageUrl: movie.image!,
                  fit: BoxFit.fill,
                  width: 120,
                  height: 100,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(movie.name!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Playfair Display SC",overflow: TextOverflow.ellipsis,
                  )),
              Text(
                'status: ${movie.status!}',
                style: TextStyle(
                    fontSize: 14.0,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: " Cinzel Decorative",
                    fontWeight: FontWeight.w500),
              )
            ],
          )),
        ),
      ),
    );
  }
}
