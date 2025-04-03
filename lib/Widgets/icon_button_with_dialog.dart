import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconButtonWithDialog extends StatelessWidget {
  const IconButtonWithDialog(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.subtitle,
      required this.icon});

  final Icon icon;
  final String title;
  final String subtitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        try {
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Confirm'),
                ),
              ],
            ),
          );
          if (confirmed == true) {
            onPressed!();
          }
        } catch (e) {
          if (kDebugMode) {
            print('Error deleting note: $e');
          }
        }
      },
      icon: icon,
      color: Colors.black,
    );
  }
}
