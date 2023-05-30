// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../home/presentation/widgets/animatedrail.dart';

// final selectedIndexProvider = StateProvider<int>((ref) => 0);

// class WebScreenlayout extends StatefulHookConsumerWidget {
//   const WebScreenlayout({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _WebScreenlayoutState();
// }

// class _WebScreenlayoutState extends ConsumerState<WebScreenlayout> {
//   @override
//   Widget build(BuildContext context) {
//     final selectedIndex = ref.watch(selectedIndexProvider);
//     return SafeArea(
//       child: Scaffold(
//           body: Row(
//         children: <Widget>[
//           NavigationRail(
//             selectedIndex: selectedIndex,
//             onDestinationSelected: (int x) {
//               ref.read(selectedIndexProvider.notifier).state = x;
//             },
//             minWidth: 100,
//             labelType: NavigationRailLabelType.selected,
//             //selectedIconTheme: const IconThemeData(color: Colors.white),
//             //selectedLabelTextStyle: TextStyle(color: Colors.lightBlue[500]),
//             //unselectedLabelTextStyle: TextStyle(color: Colors.grey[500]),
//             //elevation: 5,
//             //useIndicator: true,
//             //backgroundColor: Colors.grey[50],
//             //indicatorColor: Colors.cyan[50],
//             //leading: const MyLeadingWidget(),
//             //trailing: const MyTrailingWidget(),
//             destinations: const <NavigationRailDestination>[
//               NavigationRailDestination(
//                 icon: Icon(Icons.house_outlined),
//                 selectedIcon: Icon(Icons.house),
//                 label: Text('Home'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.star_border),
//                 selectedIcon: Icon(Icons.star),
//                 label: Text('Favorites'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.account_circle_outlined),
//                 selectedIcon: Icon(Icons.account_circle),
//                 label: Text('Profile'),
//               ),
//             ],
//           ),
//           const VerticalDivider(thickness: 1, width: 1),
//           // This is the main content.
//           Expanded(
//             child: Column(
//               children: [Text("data")],
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
