import 'package:bmi_calculator_bloc/constants/colors_constants.dart';
import 'package:bmi_calculator_bloc/constants/string_constants.dart';
import 'package:bmi_calculator_bloc/constants/style_constants.dart';
import 'package:bmi_calculator_bloc/screens/result/result_page.dart';
import 'package:bmi_calculator_bloc/screens/widgets/age_widgets.dart';
import 'package:bmi_calculator_bloc/screens/widgets/bottom_button.dart';
import 'package:bmi_calculator_bloc/screens/widgets/gender_selected.dart';
import 'package:bmi_calculator_bloc/screens/widgets/reusable_card.dart';
import 'package:bmi_calculator_bloc/screens/widgets/weight_widgets.dart';
import 'package:bmi_calculator_bloc/utilitis/calculate_result.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0b0f31),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const GenderSelectedWidgets(),
          Expanded(
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
                      "$height",
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
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100.0,
                    max: 250.0,
                    inactiveColor: inactiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
            color: activeCardColor,
          )),
          Expanded(
            child: Row(
              children: const [
                WeightWidgets(),
                AgeWidgets(),
              ],
            ),
          ),
          BottomButton(
            buttonText: "CALCULATE",
            onTap: () {
              CalculateResult calc =
                  CalculateResult(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    resultValue: calc.calculateBMI(),
                    resultComments: calc.getComments(),
                    resultText: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


