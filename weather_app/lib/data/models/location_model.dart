class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
  });

  final String name;
  final String region;
  final String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
      );
}