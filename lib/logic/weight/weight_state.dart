part of 'weight_cubit.dart';

class WeightState {
  int weight;
  WeightState({
    required this.weight,
  });
}

class WeightInitial extends WeightState {
  WeightInitial() : super(weight: 60);
}
