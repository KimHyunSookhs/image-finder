import 'package:flutter/material.dart';
import 'package:image_finder/presentation/search_screen/search_screen.dart';

void main() {
  runApp(const ImageFinder());
}

class ImageFinder extends StatelessWidget {
  const ImageFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SearchScreen());
  }
}
