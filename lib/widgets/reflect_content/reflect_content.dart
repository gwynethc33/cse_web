import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReflectionView extends StatefulWidget {
  const ReflectionView({super.key});

  @override
  State<ReflectionView> createState() => _ReflectionViewState();
}

class _ReflectionViewState extends State<ReflectionView> {
  Future<void> _launchLink(String url) async {
    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final headerFontSize = screenWidth < 700 ? 34.0 : 52.0;
    final linkFontSize = screenWidth < 700 ? 18.0 : 24.0;

   return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // HEADER
    Container(
      height: 220,
      width: double.infinity,
      color: const Color.fromARGB(255, 181, 21, 34),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.centerLeft,
      child: Text(
        'Reflection',
        style: TextStyle(
          fontSize: headerFontSize,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ),

    // LINKS SECTION
    Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _launchLink('https://drive.google.com/file/d/1DN98M0u9_YmkLyXaJNpRRQ6-IeR4GKEn/view');
                },
                child: Text(
                  'CSE Documentary Video',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          //week 1 reflection link for proj 1
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  _launchLink('https://docs.google.com/document/d/10qyUAe7QNv_is1hkONU4h7ghRrQm9EhSUEFPEbnlvUg/edit?tab=t.0');
                },
                child: Text(
                  'Week 1 Project 1 Reflection',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //WEEK 2 proj 1
               const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _launchLink('https://docs.google.com/document/d/1_CUIGl3dBOyzJjcLAzkeNo-pyD4oEAwsCH7iEGtlXJE/edit?tab=t.0');
                },
                child: Text(
                  'Week 2 Project 1 Reflection',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
              //week 3 reflection link for proj 1
               const SizedBox(height: 16),
               InkWell(
                  onTap: () {
                    _launchLink('https://docs.google.com/document/d/16JPoliL4eMTlHIAi2wSkk8g1BzW55xipjU9Ar83xCS8/edit?tab=t.0');
                  },
                  child: Text(
                    'Week 3 Project 1 Reflection',
                    style: TextStyle(
                      fontSize: linkFontSize,
                      color: const Color.fromARGB(255, 44, 73, 120),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  _launchLink('https://docs.google.com/document/d/1QGpHwvKCxGmkUpwB0tVcueFWel7C-5AU3S53pwVNNaM/edit?tab=t.0');
                },
                child: Text(
                  'Week 1 Project 2 Reflection',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),


              // week 2 reflection link for proj 2
               const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _launchLink('https://docs.google.com/document/d/1qRz27Cn3QX4Co5yPXRj9mCRdEO_ujsIJUiLkLM6jFn4/edit?tab=t.0');
                },
                child: Text(
                  'Week 2 Project 2 Reflection',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            
            //week 3 reflection proj 2
             const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _launchLink('https://docs.google.com/document/d/1sKfyozXTtcM2nDrXBwU2PM_Ypb0O5mYwC2xEAuxyFdc/edit?tab=t.0');
                },
                child: Text(
                  'Week 3 Project 2 Reflection',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //week 1 reflection proj 3
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  _launchLink('https://docs.google.com/document/d/14w5ZAogY3CnCj3sibrNdrDlpikFhYr4-8Kqd1Fgwg0Y/edit?tab=t.0');
                },
                child: Text(
                  'Week 1 Project 3 Reflection',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //week 2 reflection proj 3
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _launchLink('https://docs.google.com/document/d/1OeJq3FPH6DYspAlpONQo4K9yo5Hrlvzft4BfTIInyTk/edit?tab=t.0');
                },
                child: Text(
                  'Week 2 Project 3 Reflection',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            
            //week 3 reflection proj 3
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _launchLink('https://docs.google.com/document/d/1NmHpMAzKTLyVQ2EYDXGHsj--FLb1aXf67LIyS2d2_GU/edit?tab=t.0');
                },
                child: Text(
                  'Week 3 Project 3 Reflection',
                  style: TextStyle(
                    fontSize: linkFontSize,
                    color: const Color.fromARGB(255, 44, 73, 120),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);
  }
}