import 'package:flutter/material.dart';
import '../widgets/home_page_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomePageView(),
      ),
    );
  }
}
