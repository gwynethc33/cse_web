import 'package:cse_web/widgets/home_content/home_content.dart';
import 'package:flutter/material.dart';
import 'package:cse_web/widgets/footer/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          toolbarHeight: 10,
          title: const Material(color: Colors.white, elevation: 0),
        ),
        const SliverToBoxAdapter(child: HomeContent()),
        const SliverToBoxAdapter(child: AppFooter()),
      ],
    );
  }
}
