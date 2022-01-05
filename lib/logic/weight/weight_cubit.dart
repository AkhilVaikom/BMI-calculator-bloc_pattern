import 'package:bloc/bloc.dart';

part 'weight_state.dart';

class WeightCubit extends Cubit<WeightState> {
  WeightCubit() : super(WeightInitial());
  void weightIncrement()=>emit(WeightState(weight: state.weight+1));
  void weightDecrement()=>emit(WeightState(weight: state.weight-1));
}
