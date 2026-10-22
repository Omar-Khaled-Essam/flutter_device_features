import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// Shows the user's image, full name and email.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(AppConstants.profileImageUrl),
            ),
            const SizedBox(height: 16),
            Text(
              AppConstants.profileFullName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(AppConstants.profileEmail),
          ],
        ),
      ),
    );
  }
}
