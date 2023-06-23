import 'package:appstore/views/buyers/nav_screens/widgets/banner_widget.dart';
import 'package:appstore/views/buyers/nav_screens/widgets/category_text.dart';
import 'package:appstore/views/buyers/nav_screens/widgets/serach_input_widget.dart';
import 'package:appstore/views/buyers/nav_screens/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WelcomeText(),
        SizedBox(
          height: 10,
          ),
        SearchInputWidget(),
        BannerWidget(),
        CategortText(),
      ],
    );
  }
}
