import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_flutter/src/features/home/presentation/widgets/carousel.dart';
import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleDialogWidget extends HookConsumerWidget {
  const SimpleDialogWidget(
      {required this.images,
      required this.technologies,
      required this.sourceCode,
      required this.description,
      required this.title,
      super.key});
  final List<String> images;
  final List<String> technologies;
  final String sourceCode;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        Container(
            width: context.screenWidth * 0.5,
            constraints: BoxConstraints(maxHeight: context.screenHeight * 0.9),
            // height: context.screenHeight * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Align(alignment: Alignment.topRight, child: FaIcon(FontAwesomeIcons.stickerMule),),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    title,
                    style: GoogleFonts.openSans(
                        fontSize: 30, color: Colors.orange),
                  ),
                ),
                Text(
                  "Project Overview",
                  style: GoogleFonts.openSans(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  description,
                  style:
                      GoogleFonts.openSans(fontSize: 20, color: Colors.black),
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Text(
                            "Technologies",
                            style: GoogleFonts.openSans(
                              color: Colors.purple,
                              fontSize: 25,
                            ),
                          ),
                          Column(
                            children: technologies
                                .map((e) => Container(
                                      width: 180,
                                      height: 50,
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder()),
                                          child: Text(e)),
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Flexible(child: CarouselSliderWidget(images: images)),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder()),
                        onPressed: () async {
// Future<void> _launchUniversalLinkIos(Uri url) async {
                          await launchUrl(
                            Uri.parse(sourceCode),
                          );
                          // if (!nativeAppLaunchSucceeded) {
                          //   await launchUrl(
                          //     Uri.parse(sourceCode),
                          //   );
                          // }
                          // }
                        },
                        child: Text("Source Code")),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
