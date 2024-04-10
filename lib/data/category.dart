class CategoryModel {
  final String title;
  final String description;

  CategoryModel({
    required this.title,
    required this.description,
  });

  static const String sanityCategory = '''
{
  title,
  description,
}
''';

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
