import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<List<dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final imagesResponse = http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all/images'));
    final movieDataResponse = http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

    final responses = await Future.wait([imagesResponse, movieDataResponse]);

    if (responses.every((response) => response.statusCode == 200)) {
      final imagesData = jsonDecode(responses[0].body);
      final movieData = jsonDecode(responses[1].body);

      return [imagesData, movieData];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Data'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            List<String> images = (snapshot.data![0] as List).cast<String>();
            List<MovieModel> movies = (snapshot.data![1]! as List).map((json) => MovieModel.fromJson(json)).toList();
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieInfoCard(movie: movies[index], imageUrl: images[index]);
              },
            );
          }
        },
      ),
    );
  }
}
//
// class MovieModel {
//   final String name;
//   final String summary;
//   final double? rating;
//   final List<String> genres;
//   final String url;
//   final Schedule schedule;
//   final String? ended;
//   final int? avgTime;
//   final Show show;
//
//   MovieModel({
//     required this.name,
//     required this.summary,
//     required this.rating,
//     required this.genres,
//     required this.url,
//     required this.schedule,
//     required this.ended,
//     required this.avgTime,
//     required this.show,
//   });
//
//   factory MovieModel.fromJson(Map<String, dynamic> json) {
//     return MovieModel(
//       name: json['show']['name'] ?? "N/A",
//       summary: json['show']['summary'] ?? "N/A",
//       rating: json['show']['rating']['average']?.toDouble(),
//       genres: List<String>.from(json['show']['genres'] ?? []),
//       url: json['show']['url'] ?? "N/A",
//       schedule: Schedule.fromJson(json['show']['schedule'] ?? {}),
//       ended: json['show']['ended'] ?? "N/A",
//       avgTime: json['show']['averageRuntime'] as int?,
//       show: Show.fromJson(json['show']),
//     );
//   }
// }


class MovieModel {
  final String name;
  final String summary;
  final double? rating;
  final List<String> genres;
  final String url;
  final Schedule schedule;
  final String? ended;
  final int? avgTime;
  final Show show;
  final String? image;

  MovieModel({
    required this.name,
    required this.summary,
    required this.rating,
    required this.genres,
    required this.url,
    required this.schedule,
    required this.ended,
    required this.avgTime,
    required this.show,
    required this.image,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        name: json['show']['name'] ?? "N/A",
        summary: json['show']['summary'] ?? "N/A",
        rating: json['show']['rating']['average']?.toDouble(),
        genres: List<String>.from(json['show']['genres'] ?? []),
        url: json['show']['url'] ?? "N/A",
        schedule: Schedule.fromJson(json['show']['schedule'] ?? {}),
        ended: json['show']['ended'] ?? "N/A",
        avgTime: json['show']['averageRuntime'] as int?,
        show: Show.fromJson(json['show']),
        image: json['show']?["image"]?["medium"] ?? "N/A"
    );
  }
}
class Show {
  final int id;

  Show({required this.id});

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] ?? '',
    );
  }
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({required this.time, required this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'] ?? '',
      days: List<String>.from(json['days'] ?? []),
    );
  }
}

class MovieInfoCard extends StatelessWidget {
  final MovieModel movie;
  final String imageUrl;

  const MovieInfoCard({Key? key, required this.movie, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(movie.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating: ${movie.rating ?? 'N/A'}'),
            Text('Genres: ${movie.genres.join(', ')}'),
            Text('Schedule: ${movie.schedule.time} ${movie.schedule.days.join(', ')}'),
            Text('Ended: ${movie.ended ?? 'N/A'}'),
            Text('Average Time: ${movie.avgTime ?? 'N/A'} minutes'),
          ],
        ),
        leading: Image.network(
          imageUrl,
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        onTap: () {
          // Handle card tap if needed
        },
      ),
    );
  }
}
