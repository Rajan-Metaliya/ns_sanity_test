import 'package:flutter_sanity/flutter_sanity.dart';
import 'package:flutter_sanity_image_url/flutter_sanity_image_url.dart';

class AppConfig {
  static SanityClient sanityClient = SanityClient(
    dataset: 'production',
    projectId: 'f1rvkkre',
    token:
        'skehtrXnIbUB0rK6CnMjqWua7RDCr9eQ9XfXiWaN7jz0JwjPWqLXCPtYd6nsVWevyoKcMolDSrY7lVSz6SvpbgBb33HrlsSy63dXV1sBBSOk7OJk1dg1WEHYQ61pZQNfBUIWl7vY5FSs2NY7Qvkds5VvfLgtLv9ZxrrQPAm2wxFjmNXm86ST',
  );

  static ImageUrlBuilder imageUrlBuilder = ImageUrlBuilder(sanityClient);
}
