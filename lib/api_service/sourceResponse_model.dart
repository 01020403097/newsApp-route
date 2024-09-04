class SourceResponse {
  final String? status;
  final List<Sources>? sources;

  SourceResponse({
    this.status,
    this.sources,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
        status: json['status']as String?,
        sources: (json['sources'] as List<dynamic>?)
            ?.map((e)=> Sources.fromJson(e as Map<String, dynamic>)).
    toList(),
    );
  }
}


class Sources {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  const Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Sources.fromJson(Map<String, dynamic> json) =>
      Sources(
        id: json['id'] as String?,
        name: json['name']as String?,
        description: json['description']as String?,
        url: json['url']as String?,
        category: json['category']as String?,
        language: json['language']as String?,
        country: json['country']as String?,);


}
