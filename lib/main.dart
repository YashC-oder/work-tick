import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:sih_1707/controllers/AuthController/AuthController.dart';
import 'package:sih_1707/controllers/LocalStorageController/LocalStorageController.dart';
import 'package:sih_1707/models/UserModel/User.model.dart';
import 'package:sih_1707/views/HomePage/HomePage.dart';
import 'package:sih_1707/views/LoginPage/LoginPage.dart';

final authControllerProvider = Provider((ref) => AuthController(
      client: Client(),
      localStorageController: LocalStorageController(),
    ));

final userProvider = StateProvider<UserModel?>((ref) => null);

final authStatusProvider = FutureProvider<UserModel?>((ref) async {
  final authController = ref.watch(authControllerProvider);
  final response = await authController.getUserData();
  if (response.message == null && response.data != null) {
    ref.read(userProvider.notifier).state = response.data as UserModel?;
    return response.data as UserModel?;
  }
  return null;
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authStatusProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIH 1707',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 54, 120, 244),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.ubuntu(
            color: const Color.fromRGBO(27, 27, 27, 1),
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
          displayMedium: GoogleFonts.ubuntu(
            color: const Color.fromRGBO(27, 27, 27, 1),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: GoogleFonts.ubuntu(
            color: const Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: authStatus.when(
        data: (user) => user != null ? const HomePage() : const LoginPage(),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
