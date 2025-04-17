import 'package:flutter/foundation.dart';
import 'package:image_finder/core/result/result.dart';
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

  String? get errorMessage => state.errorMessage;

  void getImageUseCase() async {
    _state = state.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    final result = await _getImageUseCase.execute();
    switch (result) {
      case Success<List<Image>, String>():
        _state = _state.copyWith(isLoading: false, images: result.data);
      case Error<List<Image>, String>():
        _state = _state.copyWith(isLoading: true, errorMessage: result.error);
    }
    notifyListeners();
  }
}
