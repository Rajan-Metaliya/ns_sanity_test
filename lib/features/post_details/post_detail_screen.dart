import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Column(
        children: [
          Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
              ),
              Text(
                'Author Name',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Wrap(
            children: [
              Chip(
                label: Text('Tag 1'),
              ),
              Chip(
                label: Text('Tag 2'),
              ),
              Chip(
                label: Text('Tag 3'),
              ),
            ],
          ),
          Text('Post Body ' * 20),
        ],
      ),
    );
  }
}
