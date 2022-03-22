import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SafeDial extends StatelessWidget {
  final int startingValue;
  final Function()? onIncrement;
  final Function()? onDecrement;
  const SafeDial(
      {Key? key,
      required this.startingValue,
      this.onIncrement,
      this.onDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(4),
        color: Colors.purple.shade100,
        constraints: const BoxConstraints(minHeight: 60),
        child: Column(
          children: [
            IconButton(
              onPressed: onIncrement,
              icon: Icon(CupertinoIcons.chevron_up),
            ),
            Expanded(
              child: Text(
                "$startingValue",
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: onDecrement,
              icon: Icon(CupertinoIcons.chevron_down),
            ),
          ],
        ));
  }
}
