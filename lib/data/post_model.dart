import 'author_model.dart';
import 'category.dart';

class PostModel {
  final String name;
  final String excerpt;
  final String slug;
  final String image;
  final AuthorModel author;
  final List<CategoryModel> categories;
  final String body;

  PostModel({
    required this.name,
    required this.slug,
    required this.image,
    required this.author,
    required this.categories,
    required this.excerpt,
    required this.body,
  });

  static const String sanityPost = '''
{
  title,
  slug,
  mainImage,
  excerpt,
  body,
  author->${AuthorModel.sanityAuthor},
  categories[]->${CategoryModel.sanityCategory},
}
''';

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      name: json['title'] as String,
      slug: json['slug']['current'] as String,
      image: json['mainImage'] as String,
      excerpt: json['excerpt'] as String,
      body: json['body'] as String,
      author: AuthorModel.fromJson(json['author']),
      categories: List<CategoryModel>.from(
        json['categories'].map(
          (category) => CategoryModel.fromJson(category),
        ),
      ),
    );
  }
}
