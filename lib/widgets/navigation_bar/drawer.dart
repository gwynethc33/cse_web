import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _go(BuildContext context, String route) {
    Navigator.pop(context); // close drawer
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
          ListTile(title: const Text('Home'), onTap: () => _go(context, '/')),
          ListTile(
            title: const Text('About Us'),
            onTap: () => _go(context, '/about'),
          ),
          ListTile(
            title: const Text('Projects'),
            onTap: () => _go(context, '/project'),
          ),
          ListTile(
            title: const Text('Infographic'),
            onTap: () => _go(context, '/infographic'),
          ),
          ListTile(
            title: const Text('Reflection'),
            onTap: () => _go(context, '/reflection'),
          ),
        ],
      ),
    );
  }
}
