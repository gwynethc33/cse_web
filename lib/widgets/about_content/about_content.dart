import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  double _lerpClamp(
    double w,
    double minW,
    double maxW,
    double minV,
    double maxV,
  ) {
    final ww = w.clamp(minW, maxW);
    final t = (ww - minW) / (maxW - minW);
    return minV + (maxV - minV) * t;
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isSmall = w < 750;

    final baseFont = _lerpClamp(w, 320, 1440, 16, 28);
    final aboutPadX = _lerpClamp(w, 320, 1440, 28, 240);
    final aboutGap = _lerpClamp(w, 320, 1440, 14, 28);
    final aboutImg = _lerpClamp(w, 320, 1440, 92, 230);
    final aboutTextPadX = _lerpClamp(w, 320, 1440, 10, 70);

    Widget dividerLine() => Container(
      height: 1,
      width: double.infinity,
      color: Colors.black.withOpacity(0.2),
    );

    Widget aboutPerson({required String imagePath, required String text}) {
      final imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: aboutImg,
          height: aboutImg,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) {
            return Container(
              width: aboutImg,
              height: aboutImg,
              color: Colors.black12,
              alignment: Alignment.center,
              child: Icon(Icons.image_not_supported, size: aboutImg * 0.35),
            );
          },
        ),
      );

      final textWidget = Padding(
        padding: EdgeInsets.symmetric(horizontal: aboutTextPadX, vertical: 12),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: baseFont * 0.95,
            height: 1.3,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

      return Column(
        children: [
          dividerLine(),
          SizedBox(height: aboutGap),
          isSmall
              ? Column(
                  children: [
                    imageWidget,
                    SizedBox(height: aboutGap),
                    textWidget,
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imageWidget,
                    SizedBox(width: aboutGap),
                    Expanded(child: Center(child: textWidget)),
                  ],
                ),
          SizedBox(height: aboutGap),
          dividerLine(),
          SizedBox(height: aboutGap),
        ],
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: aboutPadX),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: aboutGap),
            Text(
              'ABOUT US',
              style: TextStyle(
                fontSize: baseFont * 0.95,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: aboutGap),
            aboutPerson(
              imagePath: 'assets/images/person1.png',
              text: 'NAME + ABOUT',
            ),
            aboutPerson(
              imagePath: 'assets/images/person2.png',
              text: 'NAME + ABOUT',
            ),
            aboutPerson(
              imagePath: 'assets/images/person3.png',
              text: 'NAME + ABOUT',
            ),
            aboutPerson(
              imagePath: 'assets/images/person4.png',
              text: 'NAME + ABOUT',
            ),
            SizedBox(height: aboutGap),
          ],
        ),
      ),
    );
  }
}
