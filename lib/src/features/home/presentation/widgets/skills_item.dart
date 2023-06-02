// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';

class SkillsCard extends HookConsumerWidget {
  const SkillsCard({
    required this.image,
    required this.fit,
    required this.text,
    this.padding = false,
  });
  final String image;
  final BoxFit fit;
  final bool padding;
  final String text;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 300,
      height: 200,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange.withOpacity(0.7)),
        color: Colors.black,
        // backgroundBlendMode: BlendMode.darken,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.orange,
            offset: Offset(0, 2),
          )
        ],
      ),
      // elevation: 5,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  Image.asset(fit: BoxFit.fill, width: 100, height: 100, image),
            ).paddingAll(8),
          ),
          Expanded(
              flex: 1,
              child: Text(
                text,
                style: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
              )).paddingOnly(left: 10, right: 20),
        ],
      ),
    ).paddingAll(8);
  }
}
/**
 * // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';

class SkillsCard extends HookConsumerWidget {
  const SkillsCard({
    required this.image,
    required this.fit,
    this.padding = false,
  });
  final String image;
  final BoxFit fit;
  final bool padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // backgroundBlendMode: BlendMode.darken,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Color.fromARGB(66, 67, 76, 145),
            offset: Offset(0, 2),
          )
        ],
      ),
      // elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 300,
          height: 200,
          child: Image.asset(
            image,
            fit: fit,
            // repeat: ImageRepeat.repeatY,
          ).paddingAll(10),
        ),
      ),
    ).paddingAll(8);
  }
}

 */