import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';

class ProjectsDemo extends HookConsumerWidget {
  const ProjectsDemo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Projects",
            style: GoogleFonts.openSans(fontSize: 40, color: Colors.orange),
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(10),
          physics: NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => Container(
            width: 100,
            height: 100,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
