
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_understanding/Views/screens/home_page.dart';

final screenProvider = Provider((ref) {
  return HomeScreen();
});


final likeProvider = StateProvider<bool>((ref) {
  return false;
});


