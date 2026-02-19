import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key, this.onMenuPressed});

  final VoidCallback? onMenuPressed;

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  static const double kLargeBreakpoint = 800;

  static const double kNavMinFont = 12.5;
  static const double kNavMaxFont = 20;
  static const double kHomeExtra = 2;

  static const double kMinWidth = 320.0;
  static const double kMaxWidth = 1440.0; // stops scaling after this

  double _responsiveFont(double screenWidth, double minFont, double maxFont) {
    final clampedWidth = screenWidth.clamp(kMinWidth, kMaxWidth);
    final scale = (clampedWidth - kMinWidth) / (kMaxWidth - kMinWidth);
    double baseSize = minFont + (maxFont - minFont) * scale;

    const boostStart = 1920.0;
    const boostEnd = 3200.0;

    if (screenWidth > boostStart) {
      final extraScale = ((screenWidth - boostStart) / (boostEnd - boostStart))
          .clamp(0.0, 1.0);

      final extraBoost = (maxFont * 0.35) * extraScale;
      baseSize += extraBoost;
    }

    return baseSize.clamp(minFont, maxFont * 1.35);
  }

  void _go(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name == route) return;
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = width >= kLargeBreakpoint;

    final navFontSize = _responsiveFont(width, kNavMinFont, kNavMaxFont);
    final horizontalPadding = width < 900 ? 16.0 : 36.0;

    if (isLargeScreen) {
      return Container(
        height: 88,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NavBarItem(
              'Home',
              fontSize: navFontSize + kHomeExtra,
              letterSpacing: 2.5,
              isActive: currentRoute == '/',
              onTap: () => _go(context, '/'),
            ),
            const SizedBox(width: 40),
            _NavBarItem(
              'About Us',
              fontSize: navFontSize,
              isActive: currentRoute == '/about',
              onTap: () => _go(context, '/about'),
            ),
            const SizedBox(width: 40),
            _NavBarItem(
              'Projects',
              fontSize: navFontSize,
              isActive: currentRoute == '/project',
              onTap: () => _go(context, '/project'),
            ),
            const SizedBox(width: 40),
            _NavBarItem(
              'Infographic',
              fontSize: navFontSize,
              isActive: currentRoute == '/infographic',
              onTap: () => _go(context, '/infographic'),
            ),
            const SizedBox(width: 40),
            _NavBarItem(
              'Reflection',
              fontSize: navFontSize,
              isActive: currentRoute == '/reflection',
              onTap: () => _go(context, '/reflection'),
            ),
            const SizedBox(width: 40),
          ],
        ),
      );
    }

    // Small screen
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: widget.onMenuPressed,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => _go(context, '/'),
            child: SizedBox(
              height: 20,
              child: _NavBarItem(
                'Home',
                fontSize: navFontSize,
                letterSpacing: 2.5,
                isActive: currentRoute == '/',
                onTap: () => _go(context, '/'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isActive;
  final double fontSize;
  final double letterSpacing;

  const _NavBarItem(
    this.label, {
    this.onTap,
    this.isActive = false,
    this.fontSize = 16,
    this.letterSpacing = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          softWrap: false,
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: fontSize,
            decoration: TextDecoration.none,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
            letterSpacing: letterSpacing,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
