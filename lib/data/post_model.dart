import 'dart:convert';

class PostModel {
  final String title;
  final Slug slug;
  final Image mainImage;
  final String excerpt;
  final List<Body> body;
  final Author author;
  final List<Category> categories;

  PostModel({
    required this.title,
    required this.slug,
    required this.mainImage,
    required this.excerpt,
    required this.body,
    required this.author,
    required this.categories,
  });

  factory PostModel.fromRawJson(String str) =>
      PostModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      slug: Slug.fromJson(json['slug']),
      mainImage: Image.fromJson(json['mainImage']),
      excerpt: json['excerpt'],
      body: List<Body>.from(json['body'].map((x) => Body.fromJson(x))),
      author: Author.fromJson(json['author']),
      categories: List<Category>.from(
        json['categories'].map((x) => Category.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'slug': slug.toJson(),
        'mainImage': mainImage.toJson(),
        'excerpt': excerpt,
        'body': List<dynamic>.from(body.map((x) => x.toJson())),
        'author': author.toJson(),
        'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Author {
  final String name;
  final Slug slug;
  final Image image;
  final List<Body> bio;

  Author({
    required this.name,
    required this.slug,
    required this.image,
    required this.bio,
  });

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json['name'],
        slug: Slug.fromJson(json['slug']),
        image: Image.fromJson(json['image']),
        bio: List<Body>.from(json['bio'].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'slug': slug.toJson(),
        'image': image.toJson(),
        'bio': List<dynamic>.from(bio.map((x) => x.toJson())),
      };
}

class Body {
  final String key;
  final List<Child> children;
  final String type;
  final String style;

  Body({
    required this.key,
    required this.children,
    required this.type,
    required this.style,
  });

  factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        key: json['_key'],
        children:
            List<Child>.from(json['children'].map((x) => Child.fromJson(x))),
        type: json['_type'],
        style: json['style'],
      );

  Map<String, dynamic> toJson() => {
        '_key': key,
        'children': List<dynamic>.from(children.map((x) => x.toJson())),
        '_type': type,
        'style': style,
      };
}

class Child {
  final String type;
  final String text;
  final String key;

  Child({
    required this.type,
    required this.text,
    required this.key,
  });

  factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        type: json['_type'],
        text: json['text'],
        key: json['_key'],
      );

  Map<String, dynamic> toJson() => {
        '_type': type,
        'text': text,
        '_key': key,
      };
}

class Image {
  final String type;
  final Asset asset;

  Image({
    required this.type,
    required this.asset,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        type: json['_type'],
        asset: Asset.fromJson(json['asset']),
      );

  Map<String, dynamic> toJson() => {
        '_type': type,
        'asset': asset.toJson(),
      };
}

class Asset {
  final String ref;
  final String type;

  Asset({
    required this.ref,
    required this.type,
  });

  factory Asset.fromRawJson(String str) => Asset.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        ref: json['_ref'],
        type: json['_type'],
      );

  Map<String, dynamic> toJson() => {
        '_ref': ref,
        '_type': type,
      };
}

class Slug {
  final String current;
  final String type;

  Slug({
    required this.current,
    required this.type,
  });

  factory Slug.fromRawJson(String str) => Slug.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Slug.fromJson(Map<String, dynamic> json) => Slug(
        current: json['current'],
        type: json['_type'],
      );

  Map<String, dynamic> toJson() => {
        'current': current,
        '_type': type,
      };
}

class Category {
  final String title;
  final String description;

  Category({
    required this.title,
    required this.description,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}
