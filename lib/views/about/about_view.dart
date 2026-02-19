import 'package:cse_web/widgets/about_content/about_content.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
          title: Material(color: Colors.white, elevation: 0),
        ),
        const SliverToBoxAdapter(child: AboutContent()),
        //const SliverToBoxAdapter(child: AppFooter()),
      ],
    );
  }
}
