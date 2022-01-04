import 'package:flutter/material.dart';

import 'package:bmi_calculator_bloc/utilitis/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String? gender;
  const IconContent({
    Key? key,
    required this.icon,
    this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: const Color(0xFF8D8E98),
          size: 80.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text("$gender", style: textLabel)
      ],
    );
  }
}
