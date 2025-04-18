import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_finder/presentation/search_screen/search_screen_view_model.dart';

class SearchScreen extends StatefulWidget {
  final SearchScreenViewModel screenViewModel;

  const SearchScreen({super.key, required this.screenViewModel});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController queryTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.screenViewModel.getImageUseCase();
  }

  @override
  void dispose() {
    queryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('이미지 검색 앱'), centerTitle: true),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListenableBuilder(
              listenable: widget.screenViewModel,
              builder: (context, child) {
                final state = widget.screenViewModel.state;
                return Column(
                  children: [
                    TextField(
                      controller: queryTextController,
                      onSubmitted: (value) {
                        widget.screenViewModel.searchImageUseCase(
                          queryTextController.text,
                        );
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        hintText: 'Search ',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.search, color: Colors.green),
                          onTap: () {
                            widget.screenViewModel.searchImageUseCase(
                              queryTextController.text,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (state.isLoading == true)
                      CircularProgressIndicator()
                    else if (state.images.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.images.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 34,
                              crossAxisSpacing: 36,
                            ),
                        itemBuilder: (context, index) {
                          final image = state.images[index];
                          return InkWell(
                            onTap: () {
                              context.push('/detail-screen/${image.id}');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                image.previewImageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      )
                    else
                      Center(child: Text('검색 결과가 없습니다')),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
