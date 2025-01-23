import 'package:flutter_riverpod/flutter_riverpod.dart';

class KNavigationBarViewModel extends StateNotifier<int> {
  KNavigationBarViewModel() : super(0);

  void setIndex(int index) {
    state = index;
  }
}

final kNavigationBarViewModelProvider =
StateNotifierProvider<KNavigationBarViewModel, int>(
      (ref) => KNavigationBarViewModel(),
);