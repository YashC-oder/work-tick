import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_1707/main.dart';
import 'package:sih_1707/widgets/Button.dart';
import 'package:sih_1707/views/LoginPage/LoginPage.dart'; // Import the LoginPage

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 50),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.person, color: Colors.black),
            title: const Text("Profile"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings, color: Colors.black),
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Button(
              onPressed: () {
                ref.read(authControllerProvider).signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              text: "Sign Out",
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
