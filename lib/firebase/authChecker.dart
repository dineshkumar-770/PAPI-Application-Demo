// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_understanding/Views/screens/home_page.dart';
// import 'package:riverpod_understanding/Views/screens/login_screen.dart';
// import 'package:riverpod_understanding/firebase/firebase_provider.dart';
// import 'package:riverpod_understanding/shimmer.dart';

// class AuthChecker extends StatelessWidget {
//   const AuthChecker({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer(builder: (context, ref, _) {
//         final authCheck = ref.watch(authStateProvider);
//         return authCheck.when(data: (data) {
//           return Center(
//             child: data!=null? HomeScreen():const LoginScreen(),
//           );
//         }, error: (e, stack) {
//           return const Center(
//             child: Text('Error'),
//           );
//         }, loading: () {
//           return const ShimmerEffect();
//         });
//       }),
//     );
//   }
// }
