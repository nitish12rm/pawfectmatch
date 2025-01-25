import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawfectmatch/core/constants/color_constants.dart';
import 'package:pawfectmatch/features/history/view/history_screen.dart';
import 'package:pawfectmatch/features/home/view/homescreen_view.dart';

import '../../../features/details/view/detailscreen_view.dart';
import '../viewmodel/bottombar_viewmodel.dart';

class KNavigationBar extends ConsumerWidget {
  const KNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(kNavigationBarViewModelProvider);
    final viewModel = ref.read(kNavigationBarViewModelProvider.notifier);

    final List<Widget> _pages = [
      HomeScreen(),
      const AdoptionHistoryScreen(),
    ];

    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor:Colors.transparent ,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => viewModel.setIndex(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home),selectedIcon: Icon(Icons.home,color: ColorConstants.orange,), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.map_outlined),selectedIcon: Icon(Icons.map,color: ColorConstants.orange,), label: 'History'),

        ],
      ),
    );
  }
}