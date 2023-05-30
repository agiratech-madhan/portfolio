import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_flutter/src/features/responsive/mobilescreen/mobilescreen.dart';
import 'package:portfolio_flutter/src/features/responsive/webscreen/webscreen.dart';
import 'package:portfolio_flutter/src/ui_utils/responsive_layout.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WebScreenlayout();
  }
}
