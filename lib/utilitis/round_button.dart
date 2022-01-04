
import 'package:flutter/material.dart';

import 'package:bmi_calculator_bloc/utilitis/constants.dart';

class RoundButton extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  const RoundButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(constraints: const BoxConstraints.tightFor(
      width: 56.0,
      height: 56.0,
    ),
    child: Icon(icon,color: Colors.white,),
    onPressed: onPressed,
    shape: const CircleBorder(),
    fillColor: inactiveColor,
    );
  }
}
