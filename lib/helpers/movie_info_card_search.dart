import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:movies/models/movie_model/MovieModel.dart';
import 'package:html/parser.dart' as htmlParser;

import '../screens/home_screen/detail_screen.dart';
class MovieInfoCardSearch extends StatelessWidget {
  const MovieInfoCardSearch({
    Key? key,
    required this.movie,
    // required this.onTap,
  }) : super(key: key);

  final MovieDataModel movie;
  // final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(movie: movie,),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            CachedNetworkImage(imageUrl: movie.image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/800px-Image_not_available.png?20210219185637",fit: BoxFit.cover,width: 100,height: 100,),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    htmlParser.parse(movie.summary!).body!.text
                    ,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}