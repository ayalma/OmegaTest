import 'package:flutter/material.dart';

class NoItemView extends StatelessWidget {
  final String message;
  final IconData icon;
  final MainAxisSize mainAxisSize;
  final double iconSize;

  const NoItemView({
    Key key,
    this.message,
    this.icon,
    this.mainAxisSize = MainAxisSize.max,
    this.iconSize = 72,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
          color: Colors.orange,
        ),
        SizedBox(
          height: 16,
        ),
        Text(message),
      ],
    );
  }
}
