class MovieModel {
  String title;
  String mediaid;
  String image;
  int duration;
  DateTime pubdate;
  String description;
  String tags;
  List<Genre> sources;

  MovieModel({
    required this.title,
    required this.mediaid,
    required this.image,
    required this.duration,
    required this.pubdate,
    required this.description,
    required this.tags,
    required this.sources,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json["title"],
        mediaid: json["mediaid"],
        image: json["image"],
        duration: json["duration"],
        pubdate: DateTime.fromMillisecondsSinceEpoch(json['pubdate'] * 1000),
        // pubdate: json["pubdate"],
        description: json["description"],
        tags: json["tags"],
        sources:
            List<Genre>.from(json["sources"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "mediaid": mediaid,
        "image": image,
        "duration": duration,
        "pubdate": pubdate,
        "description": description,
        "tags": tags,
        "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
      };
}

class Genre {
  Genre({
    required this.file,
  });

  String file;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
      };
}
