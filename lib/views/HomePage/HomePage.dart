import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_1707/controllers/HomeController/HomeController.dart';
import 'package:sih_1707/views/HomePage/components/HomeBottomNavBar.dart';
import 'package:sih_1707/views/HomePage/components/HomeDrawer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    final homeController = ref.watch(homeControllerProvider);

    return Scaffold(
      bottomNavigationBar: const HomeBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          // Handle manual attendance marking
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.event_available, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      endDrawer: const HomeDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Text(
          "WorkTick",
          style: GoogleFonts.ubuntu(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      body: homeController.currentPage,
    );
  }
}
