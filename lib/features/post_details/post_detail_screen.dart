import 'package:flutter/material.dart';

import '../../data/post_model.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              post.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(post.author.image),
                ),
                const SizedBox(width: 16),
                Text(
                  post.author.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                for (final category in post.categories)
                  Chip(
                    label: Text(category.title),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              post.body,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
