import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting Screen"),
        ),
        body: Center(
          child: Text(
            "Setting Screen",
          ),
        ));
  }
}

class MovieModel {
  final String name;
  final String summary;
  final double? rating;
  final List<dynamic> genres;
  final String url;
  final Schedule schedule;
  final String? ended;
  final int? avgTime;
  final Show show;
  final String image;

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
        image: json['show']?["image"]?["medium"] ?? "N/A");
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
  final List<dynamic> days;

  Schedule({required this.time, required this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'] ?? '',
      days: List<String>.from(json['days'] ?? []),
    );
  }
}
