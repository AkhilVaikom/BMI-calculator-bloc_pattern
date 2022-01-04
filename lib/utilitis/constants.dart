import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
int height=180;
int weight=60;
int age=20;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const inactiveColor = Color(0xFF8D8E98);
enum Gender {
  male,
  female,
}
enum CardName {
  cardWeight,
  cardAge,
}
const textLabel = TextStyle(fontSize: 18.0,color: inactiveColor);
const numberLabel = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const resultNormalColor = Color(0xFF006400);
const resultDangerColor = Color(0xFFFE0604);