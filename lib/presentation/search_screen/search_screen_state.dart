import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_finder/data/model/image.dart';

part 'search_screen_state.freezed.dart';

@freezed
class SearchScreenState with _$SearchScreenState {
  @override
  final List<Image> images;
  @override
  final bool isLoading;

  const SearchScreenState({this.images = const [], this.isLoading = false});
}
