import 'package:bmi_calculator_bloc/logic/age/age_cubit.dart';
import 'package:bmi_calculator_bloc/logic/gender/gender_cubit.dart';
import 'package:bmi_calculator_bloc/logic/height/height_cubit.dart';
import 'package:bmi_calculator_bloc/logic/weight/weight_cubit.dart';
import 'package:bmi_calculator_bloc/screens/home_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider<AgeCubit>(
          create: (context)=>
              AgeCubit(),
        ),

        BlocProvider<HeightCubit>(
          create: (context)=>
              HeightCubit(),),

        BlocProvider<WeightCubit>(
          create: (context)=>
              WeightCubit(),
        ),
        BlocProvider<GenderCubit>(
         create: (context)=>
            GenderCubit(),
         ),
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: const Color(0xff0a0e21),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xff0b0f31),
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
