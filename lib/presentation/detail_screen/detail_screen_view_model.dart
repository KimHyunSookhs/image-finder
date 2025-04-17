import 'package:flutter/foundation.dart';
import 'package:image_finder/core/result/result.dart';
import 'package:image_finder/data/model/image.dart';
import 'package:image_finder/domain/use_case/get_image_by_id_use_case.dart';
import 'package:image_finder/presentation/detail_screen/detail_screen_state.dart';

class DetailScreenViewModel with ChangeNotifier {
  final GetImageByIdUseCase _getImageByIdUseCase;

  DetailScreenViewModel({required GetImageByIdUseCase getImageByIdUseCase})
    : _getImageByIdUseCase = getImageByIdUseCase;

  DetailScreenState _state = const DetailScreenState();

  DetailScreenState get state => _state;

  Image get images => state.image;

  bool get isLoading => state.isLoading;

  void getImageByIdUseCase(int id) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getImageByIdUseCase.execute(id);
    switch (result) {
      case Success(:final data):
        print('✅ 받은 이미지 URL: ${data.largeImageUrl}');
        _state = _state.copyWith(isLoading: false, image: data); // ✅ 실제 이미지로 세팅
      case Error():
        _state = _state.copyWith(isLoading: false); // ✅ 에러 처리도 완료
    }
    notifyListeners();
  }
}
