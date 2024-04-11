import 'dart:developer';

import 'package:flutter/material.dart';

import '../../app/config/app_config.dart';
import '../../data/post_model.dart';
import '../../widgets/post_card.dart';
import '../post_details/post_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      final data = await AppConfig.sanityClient.fetch(
        """
*[_type == 'post']{
  title,
  slug,
  mainImage,
  excerpt,
  body,
  author->{
  name,
  slug,
  image,
  bio,
},
  categories[]->{
  title,
  description,
},
}
""",
      );

      // List<Map<String, dynamic>> result = data['result'];
      posts = List<PostModel>.from(
        data.map((x) => PostModel.fromJson(x)),
      );

      setState(() {});
    } catch (e, s) {
      log('Error: $e, Stack: $s');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: posts.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                mainAxisExtent: 400,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(
                  post: posts[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsScreen(
                          post: posts[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
