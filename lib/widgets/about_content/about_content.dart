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
    final aboutImg = _lerpClamp(w, 320, 1440, 400, 300);
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
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: baseFont * 0.95,
              height: 1.3,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: text.split('\n').first + '\n',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: text.substring(text.indexOf('\n') + 1)),
            ],
          ),
          textAlign: TextAlign.center,
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
              imagePath: 'assets/images/lead.png',
              text:
                  'TEAM LEADER:\n Ellamae Quiazon\nEllamae is a high school senior with a passion for raising awareness about strict parenting and the impact it has on young adults. She hopes to decrease overprotection so children can be themselves and experience life without the fear of failing. She is excited to lead the overall direction of our project and coordinate with the team to create a lasting impact. \n\n CONTACT: @1583775@sweetwaterschools.net',
            ),
            aboutPerson(
              imagePath: 'assets/images/chief.png',
              text:
                  'CHIEF EDITOR:\n Sienna Ortiz\n Sienna is a high school senior with passion for writing. She is excited to lead the content creation aspects of our project to create fun and influential videos to spread awareness to future generations. She wants to encourage them to start doing things they love without relying on social media. \n\nCONTACT: @1582845@sweetwaterschools.net',
            ),
            aboutPerson(
              imagePath: 'assets/images/techdirector.png',
              text:
                  'TECHNICAL DIRECTOR:\n Gwyneth Chan\nGwyneth is a high school senior and looking forward to bringing awareness to how much reality we miss by spending a significant amount of time on our phones. She wants to encourage everyone to participate in activities that reinforce bonds and friendships . She has experience in web development and design, and is excited to lead the technical aspects of our project to create an engaging website.\n\n CONTACT: @1611905@sweetwaterschools.net',
            ),
            aboutPerson(
              imagePath: 'assets/images/outreach.png',
              text:
                  'OUTREACH DIRECTOR:\n Luna Takabayashi\nLuna is a high school senior with a passion to recognize the loss of valuable experiences due to social media/technology, and how big a voice the younger generations have to change the world. She is excited to lead the outreach efforts of our project to connect with our audience and share our message.\n\n CONTACT: @1613387@sweetwaterschools.net',
            ),
            SizedBox(height: aboutGap),
          ],
        ),
      ),
    );
  }
}
