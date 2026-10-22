import 'package:flutter/material.dart';

import '../services/biometric_service.dart';
import '../widgets/product_tile.dart';
import 'profile_screen.dart';

/// Phase 4: shopping home with a profile icon protected by fingerprint.
class ShoppingHomeScreen extends StatelessWidget {
  const ShoppingHomeScreen({super.key});

  /// Opens the profile only when fingerprint authentication succeeds.
  Future<void> _openProfile(BuildContext context) async {
    final isAuthenticated =
        await BiometricService().authenticateWithFingerprint();
    if (!context.mounted) return;

    if (isAuthenticated) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () => _openProfile(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          ProductTile(name: 'Sneakers', price: 59.99),
          ProductTile(name: 'Backpack', price: 39.50),
          ProductTile(name: 'Headphones', price: 89.00),
          ProductTile(name: 'Smart Watch', price: 129.99),
        ],
      ),
    );
  }
}
