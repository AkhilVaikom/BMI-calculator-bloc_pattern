import 'package:bmi_calculator_bloc/constants/colors_constants.dart';
import 'package:bmi_calculator_bloc/constants/enum_constants.dart';
import 'package:bmi_calculator_bloc/logic/gender/gender_cubit.dart';
import 'package:bmi_calculator_bloc/screens/widgets/icon_content.dart';
import 'package:bmi_calculator_bloc/screens/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelectedWidgets extends StatelessWidget {
  const GenderSelectedWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderCubit, GenderState>(
      builder: (context, state) {
        return Expanded(
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () =>
                    context.read<GenderCubit>().selectGenderMale(),
                child: ReusableCard(
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    gender: "MALE",
                  ),
                  color: state.gender == Gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                ),
              )),
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      context.read<GenderCubit>().selectGenderFemale(),
                  child: ReusableCard(
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      gender: "FEMALE",
                    ),
                    color: state.gender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
