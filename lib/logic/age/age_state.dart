part of 'age_cubit.dart';

class AgeState {
int age;
  AgeState({
    required this.age,
  });
}

class AgeInitial extends AgeState {
  AgeInitial() : super(age: 18);
}
