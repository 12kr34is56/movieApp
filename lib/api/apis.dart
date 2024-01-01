import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart';
import 'package:movies/models/movie_model/MovieModel.dart';


class APIs {
  static Future<List<MovieDataModel>> movieData() async {
    List<MovieDataModel> moviesData = [];
    try {
      final response =
      await get(Uri.parse("https://api.tvmaze.com/search/shows?q=all"));
      List<dynamic> data = jsonDecode(response.body);
      // print("status code ${response.statusCode}");
      print("body ${response.body}");
      if (response.statusCode == 200) {
        moviesData = data.map((e) => MovieDataModel.fromJson(e)).toList();
        return moviesData;
      } else {
        return moviesData;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  static Future<List<MovieDataModel>> comedyMovieData() async {
    List<MovieDataModel> moviesData = [];
    try {
      final response =
      await get(Uri.parse("https://api.tvmaze.com/search/shows?q=comedy"));
      List<dynamic> data = jsonDecode(response.body);
      // print("status code ${response.statusCode}");
      print("body ${response.body}");
      if (response.statusCode == 200) {
        moviesData = data.map((e) => MovieDataModel.fromJson(e)).toList();
        return moviesData;
      } else {
        return moviesData;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  static Future<List<MovieDataModel>> searchMovieData(String movieName) async {
    List<MovieDataModel> moviesData = [];
    try {
      final response =
      await get(Uri.parse("https://api.tvmaze.com/search/shows?q=$movieName"));
      List<dynamic> data = jsonDecode(response.body);
      // print("status code ${response.statusCode}");
      print("body ${response.body}");
      if (response.statusCode == 200) {
        moviesData = data.map((e) => MovieDataModel.fromJson(e)).toList();
        return moviesData;
      } else {
        return moviesData;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  static Future<List<MovieDataModel>> mysteryMovieData() async {
    List<MovieDataModel> moviesData = [];
    try {
      final response =
      await get(Uri.parse("https://api.tvmaze.com/search/shows?q=mystery"));
      List<dynamic> data = jsonDecode(response.body);
      // print("status code ${response.statusCode}");
      print("body ${response.body}");
      if (response.statusCode == 200) {
        moviesData = data.map((e) => MovieDataModel.fromJson(e)).toList();
        return moviesData;
      } else {
        return moviesData;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  static Future<List<MovieDataModel>> categoryMovieData(String category) async {
    List<MovieDataModel> moviesData = [];
    try {
      final response =
      await get(Uri.parse("https://api.tvmaze.com/search/shows?q=$category"));
      List<dynamic> data = jsonDecode(response.body);
      // print("status code ${response.statusCode}");
      print("body ${response.body}");
      if (response.statusCode == 200) {
        moviesData = data.map((e) => MovieDataModel.fromJson(e)).toList();
        return moviesData;
      } else {
        return moviesData;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  static Future<List<MovieDataModel>> animeMovieData() async {
    List<MovieDataModel> moviesData = [];
    try {
      final response =
      await get(Uri.parse("https://api.tvmaze.com/search/shows?q=anime"));
      List<dynamic> data = jsonDecode(response.body);
      // print("status code ${response.statusCode}");
      print("body ${response.body}");
      if (response.statusCode == 200) {
        moviesData = data.map((e) => MovieDataModel.fromJson(e)).toList();
        return moviesData;
      } else {
        return moviesData;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  static Future<List<MovieDataModel>> sportsMovieData() async {
    List<MovieDataModel> moviesData = [];
    try {
      final response =
      await get(Uri.parse("https://api.tvmaze.com/search/shows?q=sports"));
      List<dynamic> data = jsonDecode(response.body);
      // print("status code ${response.statusCode}");
      print("body ${response.body}");
      if (response.statusCode == 200) {
        moviesData = data.map((e) => MovieDataModel.fromJson(e)).toList();
        return moviesData;
      } else {
        return moviesData;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  static Future<List<MovieDataModel>> romanceMovieData() async {
    List<MovieDataModel> moviesData = [];
    try {
      final response =
      await get(Uri.parse("https://api.tvmaze.com/search/shows?q=romance"));
      List<dynamic> data = jsonDecode(response.body);
      // print("status code ${response.statusCode}");
      print("body ${response.body}");
      if (response.statusCode == 200) {
        moviesData = data.map((e) => MovieDataModel.fromJson(e)).toList();
        return moviesData;
      } else {
        return moviesData;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
