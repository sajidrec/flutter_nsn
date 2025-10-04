import 'package:flutter/material.dart';

class HomeSearchResultPage extends StatelessWidget {
  const HomeSearchResultPage({super.key, required this.searchKeyword});

  final String searchKeyword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [Text("Search word $searchKeyword")]),
        ),
      ),
    );
  }
}
