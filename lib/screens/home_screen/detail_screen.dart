import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/movie_model/MovieModel.dart';
// Adjust the import based on your project structure

class DetailScreen extends StatelessWidget {
  final MovieDataModel movie;

  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name ?? 'Movie Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.image != null)
              Image.network(
                movie.image!,
                height: 350,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name ?? 'No Name',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rating: ${movie.rating}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Genres: ${movie.genres?.join(', ') ?? 'No Genres'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Status: ${movie.status ?? 'No Status'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Language: ${movie.language ?? 'No Language'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Premiered: ${movie.premiered ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ended: ${movie.ended ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Official Site'),
                          content: Text(movie.officialSite ?? 'No Site'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('close'),
                            ),TextButton(
                              onPressed: () async{
                                print('Launching URL: ${movie.officialSite}');
                                if (await canLaunchUrl(Uri.parse(movie.officialSite!))) {
                                  await launchUrl(Uri.parse(movie.officialSite!));
                                }
                              },
                              child: Text('yes'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Official Site',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Summary:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                parse(movie.summary).body!.text,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
