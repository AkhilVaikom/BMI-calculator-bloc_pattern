import 'package:bmi_calculator_bloc/logic/age/age_cubit.dart';
import 'package:bmi_calculator_bloc/logic/height/height_cubit.dart';
import 'package:bmi_calculator_bloc/screens/result_page.dart';
import 'package:bmi_calculator_bloc/utilitis/bottom_button.dart';
import 'package:bmi_calculator_bloc/utilitis/calculate_result.dart';
import 'package:bmi_calculator_bloc/utilitis/constants.dart';
import 'package:bmi_calculator_bloc/utilitis/icon_content.dart';
import 'package:bmi_calculator_bloc/utilitis/reusable_card.dart';
import 'package:bmi_calculator_bloc/utilitis/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender selectGender = Gender.male;
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      gender: "MALE",
                    ),
                    color: selectGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        gender: "FEMALE",
                      ),
                      color: selectGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<HeightCubit, HeightState>(
            builder: (context, state) {
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
                        value: height.toDouble(),
                        min: 100.0,
                        max: 250.0,
                        inactiveColor: inactiveColor,
                        onChanged: (newValue)=>context.read<HeightCubit>().updateVal(newValue),
                      ),
                    ),
                  ],
                ),
                color: activeCardColor,
              ));
            },
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: textLabel,
                      ),
                      Text(
                        "$weight",
                        style: numberLabel,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus)
                        ],
                      )
                    ],
                  ),
                  color: activeCardColor,
                )),
                BlocBuilder<AgeCubit, AgeState>(
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
                ),
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
