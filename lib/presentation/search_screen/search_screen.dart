import 'package:flutter/material.dart';
import 'package:image_finder/presentation/search_screen/search_screen_view_model.dart';

class SearchScreen extends StatefulWidget {
  final SearchScreenViewModel screenViewModel;

  const SearchScreen({super.key, required this.screenViewModel});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
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
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
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
                    suffixIcon: Icon(Icons.search, color: Colors.green),
                  ),
                ),
                SizedBox(height: 10),
                ListenableBuilder(
                  listenable: widget.screenViewModel,
                  builder: (context, child) {
                    final state = widget.screenViewModel.state;
                    return Center(child: Text('aa'));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
