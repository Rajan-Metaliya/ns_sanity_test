import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            Expanded(
              child: Image.network('https://picsum.photos/200/300'),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('Title'),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200'),
                      ),
                      Text(
                        'Author Name',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
