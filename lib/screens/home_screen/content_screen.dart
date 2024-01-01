import 'package:flutter/material.dart';
import 'package:movies/api/apis.dart';
import 'package:movies/models/movie_model/MovieModel.dart';

import '../../helpers/carasoul_slide.dart';
import '../../helpers/custom_appbar.dart';
import '../../helpers/movie_info_card.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  void initState() {
    APIs.movieData();
    super.initState();
  }

  int contentPage = 0;
  @override
  Widget build(BuildContext context) {
    String imageUrlError =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/800px-Image_not_available.png?20210219185637';
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              FutureBuilder<List<MovieDataModel>>(
                future: APIs.movieData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No data available"));
                  } else {
                    return MovieCarousel(
                      movies: snapshot.data!,
                      contentPage: contentPage,
                    );
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Align(
                    widthFactor: 2,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Comedy Movies",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Playfair Display SC",
                          color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: FutureBuilder(
                      future: APIs.comedyMovieData(),
                      builder:
                          (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (snapshot.hasData) {
                          final movies = snapshot.data!;
                          return SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                final data = movies[index];
                                return MovieInfoCard(
                                  movie: data,
                                );
                              },
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  Align(
                    widthFactor: 2,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mystery Movies",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Playfair Display SC",
                          color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: FutureBuilder(
                      future: APIs.mysteryMovieData(),
                      builder:
                          (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (snapshot.hasData) {
                          final movies = snapshot.data!;
                          return SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                final data = movies[index];
                                return MovieInfoCard(
                                  movie: data,
                                );
                              },
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Anime",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Playfair Display SC",
                          color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: FutureBuilder(
                      future: APIs.animeMovieData(),
                      builder:
                          (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (snapshot.hasData) {
                          final movies = snapshot.data!;
                          return SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                final data = movies[index];
                                return MovieInfoCard(
                                  movie: data,
                                );
                              },
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  Align(
                    widthFactor: 2,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sports Movies",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Playfair Display SC",
                          color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: FutureBuilder(
                      future: APIs.sportsMovieData(),
                      builder:
                          (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (snapshot.hasData) {
                          final movies = snapshot.data!;
                          return SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                final data = movies[index];
                                return MovieInfoCard(
                                  movie: data,
                                );
                              },
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  Align(
                    widthFactor: 2,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Romance Movies",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Playfair Display SC",
                          color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: FutureBuilder(
                      future: APIs.romanceMovieData(),
                      builder:
                          (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (snapshot.hasData) {
                          final movies = snapshot.data!;
                          return SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                final data = movies[index];
                                return MovieInfoCard(
                                  movie: data,
                                );
                              },
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
