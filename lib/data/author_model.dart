class AuthorModel {
  final String name;
  final String slug;
  final String image;
  final String bio;

  AuthorModel({
    required this.name,
    required this.slug,
    required this.image,
    required this.bio,
  });

  static const String sanityAuthor = '''
{
  name,
  slug,
  image,
  bio,
}
''';

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      name: json['name'] as String,
      slug: json['slug'] as String,
      image: json['image'] as String,
      bio: json['bio'] as String,
    );
  }
}
