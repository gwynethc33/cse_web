import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselEnlarge extends StatefulWidget {
  const CarouselEnlarge({
    super.key,
    required this.images,
    this.captions = const [],
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 2),
  });

  final List<String> images;
  final List<String> captions;
  final bool autoPlay;
  final Duration autoPlayInterval;

  @override
  State<CarouselEnlarge> createState() => _CarouselEnlargeState();
}

class _CarouselEnlargeState extends State<CarouselEnlarge> {
  int _currentIndex = 0;

  double _calculateCarouselHeight(double screenHeight) {
    final h = screenHeight * 0.5;
    if (h < 350) return 350;
    if (h > 700) return 700;
    return h;
  }

  double _calculateCaptionFontSize(double screenWidth) {
    if (screenWidth < 400) return 16;
    if (screenWidth > 800) return 22;
    return 18 + (screenWidth - 400) * 0.01;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      for (final path in widget.images) {
        precacheImage(AssetImage(path), context);
      }
    });
  }

  String _captionForIndex(int index) {
    if (widget.captions.isEmpty) return '';
    if (index < 0 || index >= widget.captions.length) return '';
    return widget.captions[index];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final carouselHeight = _calculateCarouselHeight(screenHeight);
    final captionFontSize = _calculateCaptionFontSize(screenWidth);

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (context, index, realIndex) {
            final imagePath = widget.images[index];

            return GestureDetector(
              onTap: () => _openImageDialog(
                context: context,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                imagePath: imagePath,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth * 0.6,
                height: carouselHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: carouselHeight,
            enlargeCenterPage: false,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            autoPlay: widget.autoPlay,
            autoPlayInterval: widget.autoPlayInterval,

            // If this line errors in your carousel_slider version, delete it.
            pauseAutoPlayOnTouch: true,

            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),

        const SizedBox(height: 12),

        if (_captionForIndex(_currentIndex).isNotEmpty)
          Text(
            _captionForIndex(_currentIndex),
            style: TextStyle(
              fontSize: captionFontSize,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 60, 60, 60),
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }

  Future<void> _openImageDialog({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required String imagePath,
  }) async {
    final maxDialogWidth = screenWidth * 0.95;
    final maxDialogHeight = screenHeight * 0.95;

    final imageProvider = AssetImage(imagePath);
    final imageSize = await _getImageSize(imageProvider);

    if (!mounted) return;

    final aspectRatio = imageSize.width / imageSize.height;

    double displayWidth;
    double displayHeight;

    if (maxDialogWidth / maxDialogHeight > aspectRatio) {
      displayHeight = maxDialogHeight;
      displayWidth = displayHeight * aspectRatio;
    } else {
      displayWidth = maxDialogWidth;
      displayHeight = displayWidth / aspectRatio;
    }

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (dialogContext) {
        final iconSize = _getCloseIconSize(screenWidth);

        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(dialogContext).pop(),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    SizedBox(
                      width: displayWidth,
                      height: displayHeight,
                      child: Image.asset(
                        imagePath,
                        width: displayWidth,
                        height: displayHeight,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => Navigator.of(dialogContext).pop(),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: iconSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<Size> _getImageSize(ImageProvider provider) {
    final completer = Completer<Size>();
    final stream = provider.resolve(const ImageConfiguration());

    late final ImageStreamListener listener;
    listener = ImageStreamListener(
      (ImageInfo info, bool _) {
        stream.removeListener(listener);
        if (!completer.isCompleted) {
          completer.complete(
            Size(info.image.width.toDouble(), info.image.height.toDouble()),
          );
        }
      },
      onError: (Object error, StackTrace? stackTrace) {
        stream.removeListener(listener);
        if (!completer.isCompleted) completer.complete(const Size(1000, 1000));
      },
    );

    stream.addListener(listener);

    return completer.future.timeout(
      const Duration(seconds: 2),
      onTimeout: () {
        stream.removeListener(listener);
        return const Size(1000, 1000);
      },
    );
  }
}

double _getCloseIconSize(double screenWidth) {
  if (screenWidth > 800) return 40;
  if (screenWidth > 400) return 24 + (screenWidth - 400) * 0.04;
  return 16;
}
