
import 'package:bmi_calculator_bloc/constants/colors_constants.dart';
import 'package:bmi_calculator_bloc/constants/string_constants.dart';
import 'package:flutter/material.dart';


class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColor,
        margin:const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
            child: Text(
          buttonText,
          style: const TextStyle(fontSize: 30.0),
        )),
      ),
    );
  }
}
