// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter/src/features/home/presentation/widgets/contact_page.dart';

import 'package:portfolio_flutter/src/features/home/presentation/widgets/skills_grid.dart';
import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/presentation/widgets/projects_single.dart';
import '../../home/presentation/widgets/simple_dialog.dart';

// import '../../home/presentation/widgets/animatedrail.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class WebScreenlayout extends StatefulHookConsumerWidget {
  const WebScreenlayout({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WebScreenlayoutState();
}

class _WebScreenlayoutState extends ConsumerState<WebScreenlayout> {
  @override
  Widget build(BuildContext context) {
    print("screenHeight ${context.screenWidth}");
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: AppBar(
        backgroundColor: const Color(0xff171717),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              child: Text("M"),
              radius: 24,
            ),
            Row(
              children: [
                // Container(
                //   child: Column(
                //     children: [
                //       TextButton(
                //         // icon: Icon(
                //         //   Icons.home,
                //         //   color: Colors.orange,
                //         // ),
                //         onPressed: () {},
                //         child: Text(
                //           "Home",
                //           style: GoogleFonts.openSans(color: Colors.white),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    final String url =
                        "https://github.com/agiratech-madhan?tab=repositories";

                    await launchUrl(Uri.parse(url));
                  },
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await launchUrl(
                      Uri.parse("https://www.linkedin.com/in/madhan-k-/"),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'madhan.k@agiratech.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Example Subject & Symbols are allowed!',
                      }),
                    );

                    launchUrl(emailLaunchUri);
                  },
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // width: context.screenWidth * 0.8,
              decoration: const BoxDecoration(
                  // color: Colors.grey.withOpacity(
                  //   0.3,
                  // ),
                  ),

              height: context.screenHeight * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ABoutMeSection(),

                  // Container(
                  //     child: Image.network(
                  //         height: 200,
                  //         width: 400,
                  //         "data:image/jpeg;base64,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"))
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            // CircleAvatar(
            //   radius: 20,
            //   child: IconButton(
            //       onPressed: () {},
            //       icon: FaIcon(
            //         FontAwesomeIcons.github,
            //         color: Colors.grey,
            //       )),
            // ),
            //     SizedBox(
            //       width: 20,
            //     ),
            //     CircleAvatar(
            //       radius: 20,
            //       child: IconButton(
            //           onPressed: () {},
            // icon: FaIcon(
            //   FontAwesomeIcons.linkedin,
            //   color: Colors.grey,
            // )),
            //     ),
            //     SizedBox(
            //       width: 20,
            //     ),
            //     CircleAvatar(
            //       radius: 20,
            //       child: IconButton(
            //           onPressed: () {},
            //           icon: Icon(
            //             Icons.email_outlined,
            //             color: Colors.grey,
            //           )),
            //     )
            //   ],
            // ),
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                  maxWidth: context.screenWidth * 0.72,
                  minWidth: context.screenWidth * 0.4),
              // width: 800,

              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About me",
                              style: GoogleFonts.openSans(
                                  fontSize: 40, color: Colors.orange),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              "  I am a passionate Flutter developer who thrives on coding and continuously updating my skills. With a deep love for problem-solving, I am driven to achieve challenging targets , I am excited about the future possibilities in mobile app development",
                              softWrap: true,
                              textAlign: TextAlign.justify,
                              // maxLines: 2,
                              style: GoogleFonts.openSans(
                                  fontSize: 22, color: Colors.grey),
                            ),
                          ],
                        ).paddingAll(15),
                      ),
                      (context.screenWidth > 600)
                          ? SizedBox(
                              width: context.screenWidth * 0.02,
                            )
                          : SizedBox(),
                      (context.screenWidth > 600)
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.orange,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              // margin:
                              //     EdgeInsets.only(right: context.screenWidth * 0.078),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.fitWidth,
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5hgepNPAzZM3e0ISUFWZ1UFcX5DrMxGCSQpM03MLe9Z-jHqh3R11ErjcEG9p9Yogq8Rs&usqp=CAU"),
                              ),
                            )
                          : SizedBox(),
                    ],
                  )),
            ),
            (context.screenWidth < 600)
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.orange,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    // margin:
                    //     EdgeInsets.only(right: context.screenWidth * 0.078),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          width: 300,
                          height: 200,
                          fit: BoxFit.fill,
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5hgepNPAzZM3e0ISUFWZ1UFcX5DrMxGCSQpM03MLe9Z-jHqh3R11ErjcEG9p9Yogq8Rs&usqp=CAU"),
                    ),
                  )
                : SizedBox(),
            Align(
              // alignment: Alignment.centerLeft,
              child: Container(
                // alignment: Alignment.centerLeft,
                constraints: BoxConstraints(
                    maxWidth: context.screenWidth * 0.9,
                    minWidth: context.screenWidth * 0.4),
                // width: 800,

                child: const SkillGridView(),
              ),
            ).paddingAll(20),
            Align(
              // alignment: Alignment.centerLeft,
              child: Container(
                // alignment: Alignment.center,
                constraints: BoxConstraints(
                    maxWidth: context.screenWidth * 0.72,
                    minWidth: context.screenWidth * 0.4),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Projects",
                        style: GoogleFonts.openSans(
                            fontSize: 40, color: Colors.orange),
                      ),
                    ).paddingAll(10),
                    const Wrap(
                      children: [
                        InstaProject(),
                        TodoProject(),
                        ThaiProject(),
                        // const SwiperProject(),
                        BitstampProject()
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ContactSection()
          ],
        ),
      ),
    );
  }
}

class ABoutMeSection extends StatelessWidget {
  const ABoutMeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   textAlign: TextAlign.center,
          //   "  Flutter  developer ",
          //   style: GoogleFonts.openSans(
          //     fontSize: 20,
          //     color: Colors.grey.withOpacity(0.5),
          //   ),
          // ),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: "Hi, I'm",
                style: GoogleFonts.openSans(fontSize: 40, color: Colors.white),
              ),
              TextSpan(
                text: " MADHAN",
                style: GoogleFonts.openSans(fontSize: 40, color: Colors.orange),
              )
            ],
          )),
          Text("A Flutter Developer",
              style: GoogleFonts.openSans(fontSize: 16, color: Colors.grey)),
          Text(
            textAlign: TextAlign.center,
            "I am a mobile application developer who creates cross-platform mobile applications. I desire to create products that people love to use.",
            style: GoogleFonts.openSans(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
