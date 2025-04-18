import 'package:flutter/foundation.dart';
import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/use_case/get_image_by_id_use_case.dart';
import 'package:image_finder/presentation/detail_screen/detail_screen_state.dart';

class DetailScreenViewModel with ChangeNotifier {
  final GetImageByIdUseCase _getImageByIdUseCase;

  DetailScreenViewModel({required GetImageByIdUseCase getImageByIdUseCase})
    : _getImageByIdUseCase = getImageByIdUseCase;

  DetailScreenState _state =  DetailScreenState();

  DetailScreenState get state => _state;

  // Image get image => state.image;
  //
  // bool get isLoading => state.isLoading;

  Future<void> getImageByIdUseCase(int id) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getImageByIdUseCase.execute(id);
    if (result is Success<List<Image>, String>) {
      _state = _state.copyWith(image: result.data.first, isLoading: false);
    } else if (result is Error<List<Image>, String>) {
      _state = _state.copyWith(
        isLoading: false,
      );
    }


    notifyListeners();
  }



}


