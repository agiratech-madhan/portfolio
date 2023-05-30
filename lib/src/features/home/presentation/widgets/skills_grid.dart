import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_flutter/src/features/home/presentation/widgets/skills_item.dart';
import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';

final hoverhook = StateProvider<bool>((ref) => false);

class SkillGridView extends HookConsumerWidget {
  const SkillGridView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final over = ref.watch(hoverhook);
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Skills",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Wrap(
            // direction: Axis.vertical,
            children: [
              ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        color: Color.fromARGB(66, 67, 76, 145),
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      width: 200,
                      height: 200,
                      'assets/images/flutter.jpeg',
                      fit: BoxFit.contain,
                      // repeat: ImageRepeat.repeatY,
                    ).paddingAll(10),
                  ),
                ).paddingAll(8),
              ),
              SkillsCard(image: 'assets/images/dart.png', fit: BoxFit.contain),
              SkillsCard(
                  image: 'assets/images/image00.png', fit: BoxFit.contain),
              SkillsCard(
                image: 'assets/images/hive.jpg',
                fit: BoxFit.contain,
                padding: true,
              ),
              SkillsCard(
                image: 'assets/images/sqllite.png',
                fit: BoxFit.contain,
                padding: true,
              ),
              SkillsCard(
                image: 'assets/images/github.png',
                fit: BoxFit.contain,
                padding: true,
              ),
              SkillsCard(
                image: 'assets/images/html.png',
                fit: BoxFit.contain,
                padding: true,
              ),
              SkillsCard(
                image: 'assets/images/css.png',
                fit: BoxFit.contain,
                padding: true,
              ),
              SkillsCard(
                image: 'assets/images/js.png',
                fit: BoxFit.contain,
                padding: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
