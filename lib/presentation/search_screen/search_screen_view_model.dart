import 'package:flutter/foundation.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/use_case/get_image_use_case.dart';
import 'package:image_finder/presentation/search_screen/search_screen_state.dart';

class SearchScreenViewModel with ChangeNotifier {
  final GetImageUseCase _getImageUseCase;

  SearchScreenViewModel({required GetImageUseCase getImageUseCase})
    : _getImageUseCase = getImageUseCase;

  SearchScreenState _state = const SearchScreenState();

  SearchScreenState get state => _state;

  List<Image> get images => state.images;

  bool get isLoading => state.isLoading;

  Future<void> getImageUseCase(String prompt) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    await _getImageUseCase.execute(prompt);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
