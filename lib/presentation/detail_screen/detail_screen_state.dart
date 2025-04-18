import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_finder/data/model/image.dart';

part 'detail_screen_state.freezed.dart';

@freezed
abstract class DetailScreenState with _$DetailScreenState {
  const factory DetailScreenState({
    Image? image,
    @Default(false) bool isLoading,
  }) = _DetailScreenState;
}
