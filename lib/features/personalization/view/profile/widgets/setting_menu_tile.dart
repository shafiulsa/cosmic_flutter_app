import 'package:flutter/material.dart';

class SSettingMenuTile extends StatelessWidget {
  const SSettingMenuTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final String title, subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
