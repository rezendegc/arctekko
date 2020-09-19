import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const DefaultButton({
    Key key,
    this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}
