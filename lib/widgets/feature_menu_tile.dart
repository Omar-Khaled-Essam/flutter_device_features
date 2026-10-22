import 'package:flutter/material.dart';

/// A reusable menu entry that opens a feature screen.
class FeatureMenuTile extends StatelessWidget {
  const FeatureMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.destination,
  });

  final IconData icon;
  final String title;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        ),
      ),
    );
  }
}
