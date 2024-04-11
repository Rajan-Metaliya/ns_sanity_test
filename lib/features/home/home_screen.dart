import 'package:flutter/material.dart';
import 'package:flutter_sanity/flutter_sanity.dart';

import '../../data/post_model.dart';
import '../../widgets/post_card.dart';
import '../post_details/post_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sanityClient = SanityClient(
    dataset: 'production',
    projectId: 'f1rvkkre',
    token:
        'skehtrXnIbUB0rK6CnMjqWua7RDCr9eQ9XfXiWaN7jz0JwjPWqLXCPtYd6nsVWevyoKcMolDSrY7lVSz6SvpbgBb33HrlsSy63dXV1sBBSOk7OJk1dg1WEHYQ61pZQNfBUIWl7vY5FSs2NY7Qvkds5VvfLgtLv9ZxrrQPAm2wxFjmNXm86ST',
  );

  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      final data = await sanityClient.fetch(
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

      print('Data: $data');
      // List<Map<String, dynamic>> result = data['result'];
      posts = List<PostModel>.from(
        data.map((x) => PostModel.fromJson(x)),
      );

      setState(() {});
    } catch (e, s) {
      print('Error: $e, Stack: $s');
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
                maxCrossAxisExtent: 400,
                mainAxisExtent: 400,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
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
