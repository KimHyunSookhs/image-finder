import 'package:flutter/material.dart';
import 'package:image_finder/core/di/di_setup.dart';
import 'package:image_finder/core/routing/router.dart';

void main()async {
  diSetUP();
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
