import 'package:flutter/material.dart';

Padding buildScreenTitle(BuildContext context, String h1, String h2) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          h1,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          h2,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    ),
  );
}
