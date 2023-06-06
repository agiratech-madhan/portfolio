import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_flutter/src/features/home/presentation/widgets/simple_dialog.dart';

import '../../../responsive/webscreen/webscreen.dart';

final hoverhook = StateProvider<bool>((ref) => false);

class InstaProject extends HookConsumerWidget {
  const InstaProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final over = ref.watch(hoverhook);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            print(over);

            ref.read(hoverhook.notifier).state = !over;
          },
          child: Container(
            height: 500,
            width: 300,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.orange,
                    offset: Offset(0, 2),
                  )
                ],
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage("assets/project_assets/insta_login.png"))),
          ),
        ),
        if (over)
          InkWell(
            onTap: () {
              ref.read(hoverhook.notifier).state = !over;
              print(over);
            },
            child: Container(
              height: 170,
              width: 300,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  // BoxShadow(
                  //   blurRadius: 8,
                  //   color: Colors.orange,
                  //   offset: Offset(0, 2),
                  // )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Instagram Clone",
                    style:
                        GoogleFonts.openSans(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    "flutter",
                    style:
                        GoogleFonts.openSans(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                  child: const SimpleDialogWidget(
                                title: "Instagram clone",
                                description:
                                    "   I built this application to demonstrate the knowledge of Flutter, It has google and facebook authentication,User can able to post video or image , also the can able to view or post the comment.",
                                images: [
                                  "assets/project_assets/insta_home.png",
                                  "assets/project_assets/insta_login.png",
                                  "assets/project_assets/insta_remove.png",
                                  "assets/project_assets/insta_search.png",
                                ],
                                technologies: [
                                  "Flutter",
                                  "Dart",
                                  "Firebase",
                                  "Flutter Hooks",
                                  "Riverpod"
                                ],
                                sourceCode:
                                    'https://github.com/agiratech-madhan/instagram_clone',
                              ));
                            });
                      },
                      child: const Text("More Info"))
                ],
              ),
            ).animate().flip(),
          ),
      ],
    );
  }
}

final todoHook = StateProvider<bool>((ref) => false);

class TodoProject extends HookConsumerWidget {
  const TodoProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoHook);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            // print(over);

            ref.read(todoHook.notifier).state = !todo;
          },
          child: Container(
            height: 500,
            width: 300,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.orange,
                    offset: Offset(0, 2),
                  )
                ],
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/project_assets/todo_main.png"))),
          ),
        ),
        if (todo)
          InkWell(
            onTap: () {
              ref.read(hoverhook.notifier).state = !todo;
              print(todo);
            },
            child: Container(
              height: 170,
              width: 300,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  // BoxShadow(
                  //   blurRadius: 8,
                  //   color: Colors.orange,
                  //   offset: Offset(0, 2),
                  // )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Todo app",
                    style:
                        GoogleFonts.openSans(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    "flutter",
                    style:
                        GoogleFonts.openSans(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                  child: const SimpleDialogWidget(
                                title: "Todo App",
                                description:
                                    "   I built this application to demonstrate the knowledge of Flutter,I've implemented CRUD operation susing hive database, to improve the performance i've implemented flutter hooks aswell",
                                images: [
                                  "assets/project_assets/todo_main.png",
                                  "assets/project_assets/todo_filter.png",
                                  "assets/project_assets/todo_sort.png",
                                  "assets/project_assets/todo_new.png",
                                  "assets/project_assets/todo_test.png",
                                ],
                                technologies: [
                                  "Flutter",
                                  "Dart",
                                  "Hive",
                                  "Flutter Hooks",
                                  "Riverpod"
                                ],
                                sourceCode:
                                    'https://github.com/agiratech-madhan/flutter-riverpod/tree/hive_todo/hive_todo_app',
                              ));
                            });
                      },
                      child: const Text("More Info"))
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12),
          ),
      ],
    );
  }
}

final thaiHook = StateProvider<bool>((ref) => false);

class ThaiProject extends HookConsumerWidget {
  const ThaiProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thai = ref.watch(thaiHook);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            // print(over);

            ref.read(thaiHook.notifier).state = !thai;
          },
          child: Container(
            height: 500,
            width: 300,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.orange,
                    offset: Offset(0, 2),
                  )
                ],
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/project_assets/thai_one.png"))),
          ),
        ),
        if (thai)
          InkWell(
            onTap: () {
              ref.read(thaiHook.notifier).state = !thai;
              print(thai);
            },
            child: Container(
              height: 170,
              width: 300,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  // BoxShadow(
                  //   blurRadius: 8,
                  //   color: Colors.orange,
                  //   offset: Offset(0, 2),
                  // )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Thai App",
                    style:
                        GoogleFonts.openSans(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    "flutter",
                    style:
                        GoogleFonts.openSans(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                  child: const SimpleDialogWidget(
                                title: "Thai App",
                                description:
                                    "   I built this application to demonstrate the knowledge of Flutter, this application will break the middleware between the former and consumer, which can help to farmer to get high profit, also they can able to details of the whether conditions for farming. Ive used REST API to get the weather information ",
                                images: [
                                  "assets/project_assets/thai_one.png",
                                  "assets/project_assets/thai_carts.png",
                                  "assets/project_assets/thai_conn.png",
                                ],
                                technologies: [
                                  "Flutter",
                                  "Dart",
                                  "REST API",
                                  "Flutter Hooks",
                                  "Riverpod"
                                ],
                                sourceCode:
                                    'https://github.com/agiratech-madhan/flutter-riverpod/tree/hive_todo/hive_todo_app',
                              ));
                            });
                      },
                      child: const Text("More Info"))
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12),
          ),
      ],
    );
  }
}

final swiperHook = StateProvider<bool>((ref) => false);

class SwiperProject extends HookConsumerWidget {
  const SwiperProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiper = ref.watch(swiperHook);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            // print(over);

            ref.read(swiperHook.notifier).state = !swiper;
          },
          child: Container(
            height: 500,
            width: 300,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.orange,
                    offset: Offset(0, 2),
                  )
                ],
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/project_assets/swiper.png"))),
          ),
        ),
        if (swiper)
          InkWell(
            onTap: () {
              ref.read(swiperHook.notifier).state = !swiper;
              print(swiper);
            },
            child: Container(
              height: 170,
              width: 300,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  // BoxShadow(
                  //   blurRadius: 8,
                  //   color: Colors.orange,
                  //   offset: Offset(0, 2),
                  // )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Swiper App",
                    style:
                        GoogleFonts.openSans(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    "Flutter",
                    style:
                        GoogleFonts.openSans(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                  child: const SimpleDialogWidget(
                                title: "SWiper App",
                                description:
                                    "   I built this application to demonstrate the knowledge of Flutter, this application has animations with riverpod stat emanagement, flutter hooks implemented",
                                images: [
                                  "assets/project_assets/swiper.png",
                                ],
                                technologies: [
                                  "Flutter",
                                  "Dart",
                                  "Animations",
                                  "Flutter Hooks",
                                  "Riverpod"
                                ],
                                sourceCode:
                                    'https://github.com/agiratech-madhan/swiperapp',
                              ));
                            });
                      },
                      child: const Text("More Info"))
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12),
          ),
      ],
    );
  }
}

final bitstampHook = StateProvider<bool>((ref) => false);

class BitstampProject extends HookConsumerWidget {
  const BitstampProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bitstamp = ref.watch(bitstampHook);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            // print(over);

            ref.read(bitstampHook.notifier).state = !bitstamp;
          },
          child: Container(
            height: 500,
            width: 300,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.orange,
                    offset: Offset(0, 2),
                  )
                ],
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/project_assets/bitstamp.png"))),
          ),
        ),
        if (bitstamp)
          InkWell(
            onTap: () {
              ref.read(bitstampHook.notifier).state = !bitstamp;
              print(bitstamp);
            },
            child: Container(
              height: 170,
              width: 300,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  // BoxShadow(
                  //   blurRadius: 8,
                  //   color: Colors.orange,
                  //   offset: Offset(0, 2),
                  // )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "BitStamp App",
                    style:
                        GoogleFonts.openSans(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    "Flutter",
                    style:
                        GoogleFonts.openSans(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                  child: const SimpleDialogWidget(
                                title: "Bitstamp App",
                                description:
                                    "   I built this application to demonstrate the knowledge of Flutter,this application is provides detail information about different currencies, also it listens live update for coins information ",
                                images: [
                                  "assets/project_assets/bitstamp.png",
                                  "assets/project_assets/bitsnap_detail.png",
                                ],
                                technologies: [
                                  "Flutter",
                                  "Dart",
                                  "REST API",
                                  "Flutter Hooks",
                                  "Riverpod"
                                ],
                                sourceCode:
                                    'https://github.com/agiratech-madhan/bitstamp',
                              ));
                            });
                      },
                      child: const Text("More Info"))
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12),
          ),
      ],
    );
  }
}
