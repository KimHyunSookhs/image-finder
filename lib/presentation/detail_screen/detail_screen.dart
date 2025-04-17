import 'package:flutter/material.dart';
import 'package:image_finder/presentation/detail_screen/detail_screen_view_model.dart';

class DetailScreen extends StatefulWidget {
  final DetailScreenViewModel detailScreenViewModel;
  final int id;

  const DetailScreen({
    super.key,
    required this.detailScreenViewModel,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    widget.detailScreenViewModel.getImageByIdUseCase(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('이미지 검색 앱'), centerTitle: true),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListenableBuilder(
                listenable: widget.detailScreenViewModel,
                builder: (context, child) {
                  final state = widget.detailScreenViewModel.state;
                  if (state.isLoading == true) {
                    return CircularProgressIndicator();
                  } else if (state.image.largeImageUrl.isEmpty) {
                    return Text('이미지 정보 없음');
                  } else {
                    return Column(
                      children: [
                        Image.network(
                          state.image.largeImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
