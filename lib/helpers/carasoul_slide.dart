import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/movie_model/MovieModel.dart';
import '../screens/home_screen/detail_screen.dart';

class MovieCarousel extends StatefulWidget {
  int contentPage;
  final List<MovieDataModel> movies;

  MovieCarousel({Key? key, required this.movies, required this.contentPage})
      : super(key: key);

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.movies.length,
        itemBuilder: (context, index, _) {
          final movie = widget.movies[index];

          return Card(
            elevation: 4.0, // Adjust the elevation as needed
            shadowColor: Colors.white, // Color of the shadow
            child: Column(
              children: [
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(movie: movie,),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4.0, // Adjust the elevation as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side:
                          BorderSide(color: Colors.white), // White border color
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        height: index == widget.contentPage
                            ? MediaQuery.of(context).size.height * 0.17
                            : MediaQuery.of(context).size.height * 0.12,
                        width: index == widget.contentPage ? MediaQuery.of(context).size.width * 0.5:MediaQuery.of(context).size.width * 0.3,
                        imageUrl: movie.image ?? '',
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/800px-Image_not_available.png?20210219185637'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      movie.name ?? 'No Name',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,fontFamily: "Playfair Display SC"),
                    ),
                    Text(
                      'Rating: ${movie.rating}',
                      style: TextStyle(
                          fontSize: 14.0, overflow: TextOverflow.ellipsis,fontFamily: " Cinzel Decorative",fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  'Genres: ${movie.genres?.join(', ') ?? 'No Genres'}',
                  style: TextStyle(
                      fontSize: 14.0, overflow: TextOverflow.ellipsis,fontFamily: " Cinzel Decorative",fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.3,
          viewportFraction: 0.67,
          aspectRatio: 16 / 9,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          pageSnapping: true,
          onPageChanged: (index, reason) {
            setState(() {
              widget.contentPage = index;
            });
          },
        ));
  }
}
