
import 'package:bmi_calculator_bloc/constants/colors_constants.dart';
import 'package:bmi_calculator_bloc/constants/style_constants.dart';
import 'package:bmi_calculator_bloc/logic/age/age_cubit.dart';
import 'package:bmi_calculator_bloc/screens/widgets/reusable_card.dart';
import 'package:bmi_calculator_bloc/screens/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgeWidgets extends StatelessWidget {
  const AgeWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeCubit, AgeState>(
      builder: (context, state) {
        return Expanded(
            child: ReusableCard(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "AGE",
                style: textLabel,
              ),
              Text(
                "${state.age}",
                style: numberLabel,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundButton(
                      onPressed: () =>
                          context.read<AgeCubit>().ageDecrement(),
                      icon: FontAwesomeIcons.minus),
                  const SizedBox(
                    width: 10.0,
                  ),
                  RoundButton(
                      onPressed: () =>
                          context.read<AgeCubit>().ageIncrement(),
                      icon: FontAwesomeIcons.plus)
                ],
              ),
            ],
          ),
          color: activeCardColor,
        ));
      },
    );
  }
}
