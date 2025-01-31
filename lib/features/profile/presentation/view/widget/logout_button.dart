import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CupertinoButton(
        onPressed: () {},
        child: const Text(
          'تسجيل الخروج',
          style: TextStyle(
            color: CupertinoColors.destructiveRed,
          ),
        ),
      ),
    );
  }
}
