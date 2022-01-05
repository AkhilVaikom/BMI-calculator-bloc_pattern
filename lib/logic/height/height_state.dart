part of 'height_cubit.dart';

class HeightState {
  int height;
  Color color;
  HeightState({
    required this.height,
    required this.color,
  });
}

class HeightInitial extends HeightState {
  HeightInitial() : super(height: 160,color: inactiveColor);
  
}
