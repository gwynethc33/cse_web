import 'package:flutter/material.dart';
import 'package:cse_web/widgets/navigation_bar/navigation_bar.dart' as my_nav;
import 'package:cse_web/widgets/navigation_bar/drawer.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool get _isLargeScreen => MediaQuery.of(context).size.width >= 800;

  void _openDrawerIfSmall() {
    if (!_isLargeScreen) {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLarge = _isLargeScreen;

    return Scaffold(
      key: _scaffoldKey,
      // Drawer only exists on small screens
      drawer: isLarge ? null : const AppDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          my_nav.NavigationBar(onMenuPressed: _openDrawerIfSmall),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
