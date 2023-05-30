import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../webscreen/webscreen.dart';

class MobileScreen extends StatefulHookConsumerWidget {
  const MobileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobileScreenState();
}

class _MobileScreenState extends ConsumerState<MobileScreen> {
  // int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int x) {
            ref.read(selectedIndexProvider.notifier).state = x;
          },
        ),
        body: Center(
          child: Text('selectedIndex: $selectedIndex'),
        ));
  }
}
