import 'package:bmi_calculator_bloc/constants/string_constants.dart';
import 'package:bmi_calculator_bloc/screens/home/widgets/age_widgets.dart';
import 'package:bmi_calculator_bloc/screens/home/widgets/gender_selected.dart';
import 'package:bmi_calculator_bloc/screens/home/widgets/height_slider.dart';
import 'package:bmi_calculator_bloc/screens/home/widgets/weight_widgets.dart';
import 'package:bmi_calculator_bloc/screens/result/result_page.dart';
import 'package:bmi_calculator_bloc/screens/widgets/bottom_button.dart';
import 'package:bmi_calculator_bloc/utilitis/calculate_result.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

 
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
         const HeightSliderWidgets(),
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

