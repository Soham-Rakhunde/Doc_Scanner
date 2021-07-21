

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionsListItem extends StatelessWidget {
  // Function onPress;
  String text;
  IconData iconName;

  OptionsListItem({
    Key? key,
    required this.size,
    // required this.onPress,
    required this.iconName,
    required this.text
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          iconName,
          size: 25,
          color: Colors.white,
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}