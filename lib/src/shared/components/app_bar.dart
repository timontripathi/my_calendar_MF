import 'package:flutter/material.dart';

import '../../view/widgets/app_bar_tail.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  final String data;

  const MyAppBar({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(data),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: AppBarTail(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => throw UnimplementedError();
}
