import 'package:cse_web/widgets/home_content/home_content.dart';
import 'package:cse_web/widgets/project_content/project_content.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
        const SliverToBoxAdapter(child: ProjectContent()),
        //const SliverToBoxAdapter(child: AppFooter()),
      ],
    );
  }
}
