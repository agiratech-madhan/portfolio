import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_flutter/src/features/home/presentation/widgets/skills_item.dart';
import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';

class SkillGridView extends HookConsumerWidget {
  const SkillGridView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Skills",
            style: GoogleFonts.openSans(fontSize: 40, color: Colors.orange),
          ),
        ).paddingOnly(left: 180),
        Wrap(
          alignment: WrapAlignment.center,
          // direction: Axis.vertical,
          children: [
            // ClipRRect(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(10),
            //       boxShadow: const [
            //         BoxShadow(
            //           blurRadius: 8,
            //           color: Color.fromARGB(66, 67, 76, 145),
            //           offset: Offset(0, 2),
            //         )
            //       ],
            //     ),
            //     child: Image.asset(
            //       width: 100,
            //       height: 100,
            //       'assets/images/flutter_one.jpg',
            //       fit: BoxFit.contain,
            //       // repeat: ImageRepeat.repeatY,
            //     ).paddingAll(10),
            //   ).paddingAll(8),
            // ),
            SkillsCard(
              image: 'assets/images/dart_org.png',
              fit: BoxFit.contain,
              text: 'Dart',
            ),
            SkillsCard(
              image: 'assets/images/flutter_f.jpg',
              fit: BoxFit.contain,
              text: 'Flutter',
            ),
            SkillsCard(
              image: 'assets/images/firebase_f.png',
              fit: BoxFit.contain,
              text: 'Firebase',
            ),
            SkillsCard(
              image: 'assets/images/hive_d.png',
              fit: BoxFit.contain,
              text: 'Hive',
            ),
            SkillsCard(
              image: 'assets/images/sqllite.jpeg',
              fit: BoxFit.contain,
              text: 'SqlLite',
            ),
            SkillsCard(
              image: 'assets/images/git_hub.png',
              fit: BoxFit.contain,
              text: 'Github',
            ),
            SkillsCard(
              image: 'assets/images/html_6.png',
              fit: BoxFit.contain,
              text: 'HTML',
            ),
            SkillsCard(
              image: 'assets/images/css_4.png',
              fit: BoxFit.contain,
              text: 'CSS',
            ),
            SkillsCard(
              image: 'assets/images/js_2.png',
              fit: BoxFit.contain,
              text: 'Javascript',
            ),
          ],
        ),
      ],
    );
  }
}
