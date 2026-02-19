import 'package:flutter/material.dart';
import 'package:cse_web/widgets/carousel/carousel.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectContent extends StatelessWidget {
  const ProjectContent({super.key});

  double calculateFontSize(double screenWidth, double minFont, double maxFont) {
    const minScreenWidth = 320.0;
    const maxScreenWidth = 1200.0;
    final clampedWidth = screenWidth.clamp(minScreenWidth, maxScreenWidth);

    return minFont +
        (maxFont - minFont) *
            ((clampedWidth - minScreenWidth) /
                (maxScreenWidth - minScreenWidth));
  }

  double calculateHorizontalMargin(
    double screenWidth, {
    double min = 16,
    double max = 90,
  }) {
    const minWidth = 320;
    const maxWidth = 1200;
    return min +
        (max - min) *
            ((screenWidth.clamp(minWidth, maxWidth) - minWidth) /
                (maxWidth - minWidth));
  }

  double calculateVerticalSpacing(
    double screenHeight, {
    double min = 14,
    double max = 36,
  }) {
    const minHeight = 600;
    const maxHeight = 1200;
    return min +
        (max - min) *
            ((screenHeight.clamp(minHeight, maxHeight) - minHeight) /
                (maxHeight - minHeight));
  }

  Widget _proposalLink({
    required String title,
    required String url,
    required double fontSize,
  }) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (!ok) {
          debugPrint('Could not launch $url');
        }
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: const Color.fromARGB(255, 44, 73, 120),
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _projectItem({
    required String idea,
    required String description,
    required List<String> carouselImages,
    List<String> carouselCaptions = const [],
    required double ideaFontSize,
    required double descriptionFontSize,
    required double hPadding,
    required double hMargin,
    required double vSpacing,
  }) {
    return Column(
      children: [
        // IDEA
        Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          width: double.infinity,
          padding: EdgeInsets.all(vSpacing * 0.75),
          margin: EdgeInsets.symmetric(horizontal: hMargin),
          color: const Color.fromARGB(111, 196, 196, 196),
          child: Text(
            idea,
            style: TextStyle(
              fontSize: ideaFontSize,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
        ),

        SizedBox(height: vSpacing),

        // DESCRIPTION + CAROUSEL
        Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          width: double.infinity,
          padding: EdgeInsets.all(vSpacing * 0.75),
          margin: EdgeInsets.symmetric(horizontal: hMargin),
          color: const Color.fromARGB(255, 254, 253, 253),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: hPadding,
                  vertical: vSpacing * 0.8,
                ),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: descriptionFontSize,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: const Color.fromARGB(255, 44, 44, 44),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              if (carouselImages.isNotEmpty) ...[
                SizedBox(height: vSpacing * 0.9),
                CarouselEnlarge(
                  images: carouselImages,
                  captions: carouselCaptions,
                ),
                SizedBox(height: vSpacing * 0.9),
              ],
            ],
          ),
        ),

        SizedBox(height: vSpacing),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final headerFontSize = calculateFontSize(screenWidth, 30, 52);
    final pageDescriptionFontSize = calculateFontSize(screenWidth, 15, 22);
    final sectionTitleFontSize = calculateFontSize(screenWidth, 22, 34);

    final ideaFontSize = calculateFontSize(screenWidth, 18, 26);
    final projectDescriptionFontSize = calculateFontSize(screenWidth, 15, 22);

    final hMargin = calculateHorizontalMargin(screenWidth);
    final hPadding = calculateHorizontalMargin(screenWidth, min: 16, max: 44);
    final vSpacing = calculateVerticalSpacing(screenHeight);

    // images
    final project1Images = <String>[
      'assets/images/proj1img1.jpeg',
      'assets/images/proj1img2.jpeg',
      'assets/images/proj1img3.jpeg',
      'assets/images/proj1img4.jpeg',
      'assets/images/proj1img5.jpeg',
      'assets/images/proj1img6.jpeg',
      'assets/images/proj1img7.jpeg',
      'assets/images/proj1img8.jpeg',
      'assets/images/proj1img9.jpeg',
      'assets/images/proj1img10.jpeg',
      'assets/images/proj1img11.jpeg',
      'assets/images/proj1img12.jpeg',
      'assets/images/proj1img13.jpeg',
      'assets/images/proj1img14.jpeg',
      'assets/images/proj1img15.jpeg',
      'assets/images/proj1img16.jpeg',
      'assets/images/proj1img17.jpeg',
      'assets/images/proj1img18.jpeg',
      'assets/images/proj1img19.jpeg',
      'assets/images/proj1img20.jpeg',
      'assets/images/proj1img21.jpeg',
    ];

    final project2Images = <String>[
      'assets_webp/Doris_01.webp',
      'assets_webp/Doris_02.webp',
      'assets_webp/Doris_03.webp',
      'assets_webp/Doris_04.webp',
    ];

    final project3Images = <String>[
      'assets_webp/Wooster_01.webp',
      'assets_webp/Wooster_02.webp',
      'assets_webp/Wooster_03.webp',
      'assets_webp/Wooster_04.webp',
    ];

    // captions
    final project1Captions = const <String>[
      'Project 1 image 1',
      'Project 1 image 2',
      'Project 1 image 3',
      'Project 1 image 4',
    ];

    final project2Captions = const <String>[
      'Project 2 image 1',
      'Project 2 image 2',
      'Project 2 image 3',
      'Project 2 image 4',
    ];

    final project3Captions = const <String>[
      'Project 3 image 1',
      'Project 3 image 2',
      'Project 3 image 3',
      'Project 3 image 4',
    ];

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              height: 220,
              width: double.infinity,
              color: const Color.fromARGB(255, 181, 21, 34),
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              alignment: Alignment.centerLeft,
              child: Text(
                'Projects',
                style: TextStyle(
                  fontSize: headerFontSize,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),

            // PROPOSALS (centered)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
                vertical: vSpacing,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _proposalLink(
                        title: 'Final Proposal Google Doc',
                        url:
                            'https://docs.google.com/document/d/1YBeg6GzJGgfXLtdo6J-yz65NaLQD7es7NlZAyZFbXZM/edit?tab=t.0',
                        fontSize: pageDescriptionFontSize,
                      ),
                      const SizedBox(height: 8),
                      _proposalLink(
                        title: 'Final Proposal Canva Presentation',
                        url:
                            'https://www.canva.com/design/DAHATo_Xw_I/6RdXe4NNdZpI4vSx3doUHQ/edit',
                        fontSize: pageDescriptionFontSize,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // SECTION
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
                vertical: vSpacing * 1.25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Projects Documentation',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 44, 73, 120),
                      fontSize: sectionTitleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: vSpacing),

                  //PROJECT 1
                  _projectItem(
                    idea: 'Project 1: PODCAST EPISODE with Wishwell Counseling',
                    description:
                        'In order to learn more about the topic of antifragility and the common struggles of overprotection in parents and the impact on young adults, we invited coaches from Wishwell counseling to share their insights and advice on the importance of letting children experience failure and challenges in order to build resilience and independence. We also shared our own personal experiences and reflections on the topic, and how we plan to apply these insights to our own lives and future projects.',
                    carouselImages: project1Images,
                    carouselCaptions: project1Captions,
                    ideaFontSize: ideaFontSize,
                    descriptionFontSize: projectDescriptionFontSize,
                    hPadding: hPadding,
                    hMargin: hMargin,
                    vSpacing: vSpacing,
                  ),
                  //PROJECT 2
                  _projectItem(
                    idea: 'Project idea 2',
                    description:
                        'Replace this with your project 2 description.',
                    carouselImages: project2Images,
                    carouselCaptions: project2Captions,
                    ideaFontSize: ideaFontSize,
                    descriptionFontSize: projectDescriptionFontSize,
                    hPadding: hPadding,
                    hMargin: hMargin,
                    vSpacing: vSpacing,
                  ),
                  //PROJECT 3
                  _projectItem(
                    idea: 'Project idea 3',
                    description:
                        'Replace this with your project 3 description.',
                    carouselImages: project3Images,
                    carouselCaptions: project3Captions,
                    ideaFontSize: ideaFontSize,
                    descriptionFontSize: projectDescriptionFontSize,
                    hPadding: hPadding,
                    hMargin: hMargin,
                    vSpacing: vSpacing,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
