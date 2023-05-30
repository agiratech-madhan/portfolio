// ignore_for_file: public_member_api_docs, sort_constructors_first
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
