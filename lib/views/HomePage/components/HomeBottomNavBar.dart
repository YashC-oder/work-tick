import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_1707/controllers/HomeController/HomeController.dart';

class HomeBottomNavBar extends ConsumerWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeControllerProvider);

    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            navBarItem(
              onTap: () {
                ref.read(homeControllerProvider.notifier).updateCurrentPage(0);
              },
              icon: Icons.home,
              title: "Home",
              isSelected: homeController.page == 0,
            ),
            const SizedBox(width: 60),
            navBarItem(
              onTap: () {
                ref.read(homeControllerProvider.notifier).updateCurrentPage(1);
              },
              icon: Icons.history_edu,
              title: "History",
              isSelected: homeController.page == 1,
            ),
          ],
        ),
      ),
    );
  }
}

Widget navBarItem({required Function() onTap, required IconData icon, required String title, required bool isSelected}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      width: 100,
      decoration: isSelected ? BoxDecoration(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(100), left: Radius.circular(100)),
        color: Colors.white.withOpacity(0.2),
      ) : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
