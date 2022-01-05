import 'package:bmi_calculator_bloc/constants/colors_constants.dart';
import 'package:bmi_calculator_bloc/constants/string_constants.dart';
import 'package:bmi_calculator_bloc/constants/style_constants.dart';
import 'package:bmi_calculator_bloc/logic/height/height_cubit.dart';
import 'package:bmi_calculator_bloc/screens/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightSliderWidgets extends StatelessWidget {
  const HeightSliderWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<HeightCubit, HeightState>(
      builder: (context, state) {
        height=state.height;
        return Expanded(
            child: ReusableCard(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "HEIGHT",
                style: textLabel,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "${state.height}",
                    style: numberLabel,
                  ),
                  const Text(
                    "cm",
                    style: textLabel,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbColor: bottomContainerColor,
                    activeTrackColor: Colors.white,
                    overlayColor: const Color(0x29EB1555),
                    thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0)),
                child: Slider(
                  value: state.height.toDouble(),
                  min: 100.0,
                  max: 250.0,
                  inactiveColor: inactiveColor,
                  onChanged: (double newValue) {
                    context.read<HeightCubit>().updateVal(newValue);
                   
                  },
                ),
              ),
            ],
          ),
          color: activeCardColor,
        ));
      },
    );
  }
}
