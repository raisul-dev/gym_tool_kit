import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("My Account"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),

        child: Column(
          children: [
            // Profile picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/image.jpg'),
            ),

            const SizedBox(height: 16),

            // User name
            const Text(
              "Remon Molla",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            // User email
            const Text(
              "remon@example.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // Account Settings option
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.deepPurple),
                title: const Text("Account Settings"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Settings Clicked")),
                  );
                },
              ),
            ),

            const Spacer(),

            // Logout button
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logged out")),
                );
              },

              icon: const Icon(Icons.logout),
              label: const Text("Log Out"),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
