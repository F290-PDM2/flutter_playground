import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.info,
    required this.route
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icon),
      trailing: Icon(Icons.arrow_forward),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}
