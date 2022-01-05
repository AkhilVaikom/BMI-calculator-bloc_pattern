import 'package:bmi_calculator_bloc/constants/colors_constants.dart';
import 'package:bmi_calculator_bloc/constants/string_constants.dart';
import 'package:bmi_calculator_bloc/constants/style_constants.dart';
import 'package:bmi_calculator_bloc/logic/weight/weight_cubit.dart';
import 'package:bmi_calculator_bloc/screens/home/widgets/round_button.dart';
import 'package:bmi_calculator_bloc/screens/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightWidgets extends StatelessWidget {
  const WeightWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, WeightState>(
      builder: (context, state) {
         weight=state.weight;
        return Expanded(
            child: ReusableCard(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "WEIGHT",
                style: textLabel,
              ),
              Text(
                "${state.weight}",
                style: numberLabel,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundButton(
                    icon: FontAwesomeIcons.minus,
                    onPressed: () {
                      context.read<WeightCubit>().weightDecrement();
                     
                    },
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  RoundButton(
                    icon: FontAwesomeIcons.plus,
                    onPressed: () {
                      context.read<WeightCubit>().weightIncrement();
                     
                    },
                  ),
                ],
              )
            ],
          ),
          color: activeCardColor,
        ));
      },
    );
  }
}
