import 'package:flutter/material.dart';
import 'package:flutter_sanity/flutter_sanity.dart';

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

  String? response;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      final data = await sanityClient.fetch(
        "*[_type == 'post']{\n  title,\n  author->{\n    name\n  }\n}",
      );
      print('Data: $data');
      response = data.toString();

      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisExtent: 400,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return PostCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailsScreen(
                    description: response ?? 'Description',
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
