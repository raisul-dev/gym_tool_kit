import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Icon(
          Icons.person,
          size: 100,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
