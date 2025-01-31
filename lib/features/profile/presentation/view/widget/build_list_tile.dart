import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {
  const BuildListTile({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CupertinoListTile(
            leading: Icon(icon),
            title: Text(title),
            trailing: const Icon(CupertinoIcons.chevron_forward),
            onTap: () {},
          ),
          const Divider(
            height: 1,
            indent: 50,
            color: CupertinoColors.systemGrey5,
          ),
        ],
      ),
    );
  }
}
