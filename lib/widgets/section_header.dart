
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    this.action = 'View More',
  }) : super(
          key: key,
        );

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold)),
        Text("View More",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith())
      ],
    );
  }
}
