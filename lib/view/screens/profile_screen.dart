import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[600],
        title: const Text(
          'PROFILE',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: secondaryColor),
      ),
    );
  }
}
