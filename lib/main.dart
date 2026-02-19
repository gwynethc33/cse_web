import 'package:cse_web/views/project/project_view.dart';
import 'package:cse_web/widgets/about_content/about_content.dart';
import 'package:flutter/material.dart';

import 'package:cse_web/views/home/home_view.dart';
import 'package:cse_web/views/about/about_view.dart';
import 'package:cse_web/views/infographic/infographic_view.dart';
import 'package:cse_web/views/reflection/reflection_views.dart';
import 'package:cse_web/widgets/navigation_bar/main_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAP',
      theme: ThemeData(fontFamily: 'MeishaNagita'),
      initialRoute: '/',
      routes: {
        '/': (context) => MainShell(child: HomePage()),
        '/about': (context) => MainShell(child: AboutPage()),
        '/project': (context) => MainShell(child: ProjectPage()),
        '/infographic': (context) => MainShell(child: InfographicPage()),
        '/reflection': (context) => MainShell(child: ReflectionPage()),
      },
    );
  }
}
