import 'package:flutter/material.dart';
import 'package:image_finder/core/routing/router.dart';

void main() {
  runApp(const ImageFinder());
}

class ImageFinder extends StatelessWidget {
  const ImageFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
