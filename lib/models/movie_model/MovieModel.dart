
class MovieDataModel {
  String? name;
  String? image;
  String? summary;
  String? officialSite;
  String? language;
  List<String?>? genres;
  String? status;
  String? premiered;
  String? ended;
  dynamic rating;
  MovieDataModel(
      {this.name,
        this.image,
        this.summary,
        this.officialSite,
        this.language,
        this.genres,
        this.status,
        this.premiered,
        this.ended,
        this.rating
      });

  factory MovieDataModel.fromJson(Map<String, dynamic> json) {
    return MovieDataModel(
        name: json['show']['name'],
        image: json['show']['image']?['medium'],
        summary: json['show']['summary'],
        officialSite: json['show']?['officialSite'],
        language: json['show']['language'],
        genres: List<String?>.from(json['show']?['genres']),
        status: json['show']?['status'],
        premiered: json['show']?['premiered']?? "N/A",
        ended: json['show']?['ended']?? "N/A",
        rating: json['show']['rating']?['average'] ?? "N/A"
    );
  }
}
