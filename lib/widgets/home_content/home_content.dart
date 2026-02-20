import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

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
    final isSmall = w < 900;

    final sidePad = _lerpClamp(w, 320, 1440, 8, 20);
    final cardPad = _lerpClamp(w, 320, 1440, 18, 60);
    final cardRadius = _lerpClamp(w, 320, 1440, 18, 34);

    final heroHeight = isSmall
        ? (w * 1.05).clamp(620.0, 920.0)
        : (w * 0.68).clamp(700.0, 1100.0);

    final hugeFont = _lerpClamp(w, 320, 1440, 54, 150);
    final smallFont = _lerpClamp(w, 320, 1440, 12, 18);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: heroHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(cardRadius),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F2EE),
                  borderRadius: BorderRadius.circular(cardRadius),

                  border: Border.all(
                    color: const Color.fromARGB(255, 181, 21, 34),
                    width: cardPad * 0.55,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.all(cardPad),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F2EE),
                            borderRadius: BorderRadius.circular(
                              cardRadius * 0.75,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // main content
                    Padding(
                      padding: EdgeInsets.all(cardPad),
                      child: LayoutBuilder(
                        builder: (context, c) {
                          final wide = c.maxWidth >= 1050;
                          final phoneW = wide
                              ? (c.maxWidth * 0.20).clamp(220.0, 360.0)
                              : (c.maxWidth * 0.18).clamp(110.0, 180.0);

                          final blurbFont = wide
                              ? smallFont
                              : (smallFont * 0.85).clamp(10.0, 14.0);

                          final blurbSafeBottom = wide
                              ? 0.0
                              : (phoneW * 0.75).clamp(70.0, 120.0);

                          final leftText = Text(
                            "Bring light of the harsh \nrealities of chronic technology use \n\n& encourage healthier habits\nfor healthy development",
                            style: TextStyle(
                              fontSize: smallFont,
                              height: 1.3,
                              color: Colors.black.withOpacity(0.70),
                              fontWeight: FontWeight.w500,
                            ),
                          );

                          final bigTitle = Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "THE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: hugeFont * 0.88,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -2,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(
                                height: _lerpClamp(w, 320, 1440, 12, 26),
                              ),

                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "ANTIFRAGILE",
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: hugeFont * 4,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -1.2,
                                    height: 1.0,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: _lerpClamp(w, 320, 1440, 12, 26),
                              ),

                              Text(
                                "PROJECT",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: hugeFont * 0.8,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -2,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          );

                          final main = !wide
                              ? Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 24,
                                          top: 8,
                                        ),
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            maxWidth: 360,
                                          ),
                                          child: leftText,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            maxWidth: 1200,
                                          ),
                                          child: bigTitle,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const SizedBox(height: 70),
                                  ],
                                )
                              : Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      width: 320,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          28,
                                          12,
                                          16,
                                          0,
                                        ),
                                        child: leftText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Center(
                                              child: ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                      maxWidth: 1200,
                                                    ),
                                                child: bigTitle,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 6,
                                              bottom: 90,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: phoneW + 36),
                                  ],
                                );

                          return Stack(
                            children: [
                              Positioned.fill(child: main),

                              // phone overlay (now responsive!)
                              Positioned(
                                right: 24,
                                bottom: wide ? 80 : 24,
                                child: _PhoneMock(width: phoneW),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneMock extends StatelessWidget {
  const _PhoneMock({required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    final height = width * 1.95;

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.18),
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Image.asset(
            "assets/images/phone.png",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) {
              return Container(
                color: Colors.black,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(14),
              );
            },
          ),
        ),
      ),
    );
  }
}
