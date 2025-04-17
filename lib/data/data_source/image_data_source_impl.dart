import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_finder/data/data_source/data_source.dart';
import 'package:image_finder/data/dto/image_dto.dart';

//API에서 데이터를 받아와 직렬화 해줌
class ImageDataSourceImpl implements ImageDataSource {
  final String baseUrl =
      'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb';

  @override
  Future<List<ImageDto>> getImages() async {
    final response = await http.get(Uri.parse(baseUrl));
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> hits = json['hits'];
        final image = hits.map((e) => ImageDto.fromJson(e)).toList();
        return image;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      return throw (e);
    }
  }
}
