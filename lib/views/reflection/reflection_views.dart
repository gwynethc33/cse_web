import 'package:cse_web/widgets/reflect_content/reflect_content.dart';
import 'package:flutter/material.dart';
import 'package:cse_web/widgets/footer/footer.dart';

class ReflectionPage extends StatefulWidget {
  const ReflectionPage({super.key});

  @override
  State<ReflectionPage> createState() => _ReflectionPageState();
}

class _ReflectionPageState extends State<ReflectionPage> {
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
        const SliverToBoxAdapter(child: ReflectionView()),
        const SliverToBoxAdapter(child: AppFooter()),
      ],
    );
  }
}
