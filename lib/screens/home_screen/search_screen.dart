import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/helpers/movie_info_card_search.dart';
import 'dart:convert';

import '../../api/apis.dart';
import '../../helpers/movie_info_card.dart';
import '../../models/movie_model/MovieModel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<List<MovieDataModel>>? _searchFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter movie name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    String movieName = _searchController.text;
                    if (movieName.isNotEmpty) {
                      setState(() {
                        _searchFuture = APIs.searchMovieData(movieName);
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<MovieDataModel>>(
              future: _searchFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final movie = snapshot.data![index];
                      return MovieInfoCardSearch(movie: movie);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}



// ... (your MovieDataModel class and other code)
