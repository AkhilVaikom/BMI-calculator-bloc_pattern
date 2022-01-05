//import 'package:bmi_calculator/input_page.dart';

import 'package:bmi_calculator_bloc/constants/colors_constants.dart';
import 'package:bmi_calculator_bloc/constants/style_constants.dart';
import 'package:bmi_calculator_bloc/screens/widgets/bottom_button.dart';
import 'package:bmi_calculator_bloc/screens/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.resultText,
    required this.resultValue,
    required this.resultComments,
  }) : super(key: key);
  final String resultText;
  final String resultValue;
  final String resultComments;
  
  //static const routeName='/result';

  @override
  Widget build(BuildContext context) {
    Color resulColor= resultText=="Normal"? resultNormalColor : resultDangerColor;
    //InputPage inputPage = ModalRoute.of(context).settings.arguments;
    //final result = ModalRoute.of(context)!.settings.arguments as ResultPage;
    return Scaffold(
      //backgroundColor: inactiveCardColor,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            child: SizedBox(
              child: Text(
                "Your Result",
                style: numberLabel,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    
                    style: TextStyle(
                        color: resulColor, fontSize: 30.0),
                  ),
                  Text(
                    resultValue,
                    style: const TextStyle(fontSize: 100.0),
                  ),
                  Text(
                    resultComments,
                    style: const TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonText: "RE-CALCULATE"),
        ],
      ),
    );
  }
}
